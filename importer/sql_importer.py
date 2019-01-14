import requests
from datetime import datetime
from elasticsearch import Elasticsearch
from elasticsearch import helpers

es = Elasticsearch(host='0.0.0.0',port=9201)

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
