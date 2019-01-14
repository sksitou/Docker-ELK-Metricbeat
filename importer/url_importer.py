import requests
from datetime import datetime
from elasticsearch import Elasticsearch

es = Elasticsearch(host='0.0.0.0',port=9201)

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
