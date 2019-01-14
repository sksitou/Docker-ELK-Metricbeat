import requests
from datetime import datetime
from elasticsearch import Elasticsearch

es = Elasticsearch(host='192.168.2.4',port=9201)

url = "http://192.168.2.6:8210/?keyword=Yy90d2l0dGVy&startid=0&endid=19&startdate=20180715&enddate=20181016&querytype=searchNewsParallel&lang=en"

r = requests.get(url).json()['res']['res']

actions = []
for i,e in enumerate(r):
    actions.append(
        {
            "_index": "dummy",
            "_type": "dum",
            "_id": i,
            "content": e
        }
    )
helpers.bulk(es, actions)
