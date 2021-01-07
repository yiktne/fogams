from flask import Flask, request
from urllib import parse
import random
import json
import requests
import imageCluster
import colorCluster

app = Flask(__name__)

server_url = "http://localhost:8787/fogams/"

data = {}

@app.route('/')
def main():

    img = []

    for city in data.keys():
        tag = "<h1>" + city + "</h1>"
        for sort in data[city].keys():
            tag += "<h2>" + sort + "</h2><div>"

            labels = [[], [], [], [], []]

            for value in data[city][sort]:
                labels[data[city][sort][value]['label']].append(value)

            for label in labels:
                if len(label) > 0:
                    tag += "<h3>" + str(data[city][sort][label[0]]['label']) + "</h3>"

                    for value in label:
                        tag += "<p style='display: inline-block;'><img style='width: 100px; height: 100px;' src='" + data[city][sort][value]['uri'] + "' /><br/>" + str(data[city][sort][value]['id']) + "</p>"

            tag += "</div>"

        img.append(tag)

    html = """
    <html lang="en">
    <head>
        <title>Document</title>
    </head>
    <body>
        """

    for tag in img:
        html += tag

    html += """
    </body>
    </html>
    """

    return html

@app.route('/add', methods=["POST"])
def addImage():
    global data
    params = json.loads(request.get_data())
    if len(params) != 0:
        if params["city"] not in data:
            data[params["city"]] = {}

        if params["sort"] not in data[params["city"]]:
            data[params["city"]][params["sort"]] = {}
        
        url = server_url + "img.do?img=" + parse.quote_plus(params["url"])

        data[params["city"]][params["sort"]][str(params["id"])] = {'id':str(params["id"]), 'value':imageCluster.clusterImageURL(url), 'uri':url}

        save()
        load()

    return {"success":True}

@app.route('/get/<id>/<city>/<sort>')
def getNear(id, city, sort):
    labels = [[], [], [], [], []]
    for value in data[city][sort]:
        if value != id:
            labels[data[city][sort][value]["label"]].append(value)

    result = None

    if len(labels[data[city][sort][id]["label"]]) <= 5:
        result = labels[data[city][sort][id]["label"]]
    else :
        result = random.sample(labels[data[city][sort][id]["label"]], 5)

    print(result)

    return {'id':result}

@app.route('/init')
def loadAll():
    print("initialing...")
    global data
    res = requests.get(server_url + "alllist.do")
    jres = json.loads(res.text)

    for value in jres:
        if value["city"] not in data:
            data[value["city"]] = {}

        if value["sort"] not in data[value["city"]]:
            data[value["city"]][value["sort"]] = {}    
        
        if value["id"] not in data[value["city"]].keys():
            url = server_url + "img.do?img=" + parse.quote_plus(value["url"])
            color = imageCluster.clusterImageURL(url)

            if color is None or len(color) == 0:
                print("image error : " + value["url"])
            else:
                print(value["id"])
                data[value["city"]][value["sort"]][value["id"]] = {'id':value["id"], 'value':color, 'uri':url}
    
    save()
    load()

    return {"success":True}

def save():
    print("save..")
    with open('data.json', 'w', encoding='utf-8') as f:
        f.write(str(data).replace('\'', '\"'))

def load():
    print("load..")
    with open('data.json', 'r', encoding='utf-8') as f:
        global data
        file = json.loads(f.read())
        data = colorCluster.makeColorCluster(file)
        print("load finished")
    
load()

if __name__ == '__main__':
    app.run(port=8585)  