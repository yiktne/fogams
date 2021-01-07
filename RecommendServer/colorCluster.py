from typing import Type
from sklearn.cluster import KMeans

def makeColorCluster(data):
    keys = data.keys()

    for city in keys:
        citydata = []
        for sort in data[city]:
            key = data[city][sort].keys()
            for value in key:
                citydata.append([data[city][sort][value]["value"]["r"], data[city][sort][value]["value"]["g"], data[city][sort][value]["value"]["b"]])
        
            count = 5
            if len(citydata) < 5:
                count = len(citydata)

            Kmean = KMeans(n_clusters=count)
            Kmean.fit(citydata)

            keylist = list(key)

            for i in range(len(keylist)):
                data[city][sort][keylist[i]]["label"] = Kmean.labels_[i]

    return data