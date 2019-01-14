import requests
from datetime import datetime
from elasticsearch import Elasticsearch
from elasticsearch import helpers

es = Elasticsearch(host='192.168.2.4',port=9201)


url = "http://192.168.2.6:8210/?keyword=Yy90d2l0dGVy&startid=0&endid=19&startdate=20180715&enddate=20181016&querytype=searchNewsParallel&lang=en"

r = requests.get(url).json()['res']['res']

actions = []
for i,e in enumerate(r):
    actions.append(
        {
            "_id": i,
            "_type": "doc",
            "_index": "dummy2",
            "properties":{
                "content": e
            },
            "geo": "41.12,-71.34"
        }
    )
helpers.bulk(es, actions)
