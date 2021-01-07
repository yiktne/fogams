from cv2 import cv2
import numpy as np
from urllib import request
from sklearn.cluster import KMeans

def url_to_image(url):
    resp = request.urlopen(url)
    image = np.asarray(bytearray(resp.read()), dtype="uint8")

    if image is None or len(image) == 0:
        return None

    image = cv2.imdecode(image, cv2.IMREAD_COLOR)

    if image is None:
        gif = cv2.VideoCapture(url)
        image = gif.read()[1]
    
    return image    

def clusterImageURL(url):
    image = url_to_image(url)

    if image is None:
        return None

    return clusterImage(image)
            

def clusterImage(image):
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    image = image.reshape((image.shape[0] * image.shape[1], 3))

    clt = KMeans(n_clusters = 1)
    clt.fit(image)

    result = {}

    for center in clt.cluster_centers_:
        result = {'r':center[0], 'g':center[1], 'b':center[2]}
    
    return result

clusterImageURL("http://localhost:8787/fogams/img.do?img=room258.gif")