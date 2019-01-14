# Dockers-ELK-Metricbeat

ELK stack that support redis and python supervisor logging. Unify all the logs in one place. And create a dashboard to monitor all processes

Run an old version of the ELK (Elasticsearch 5, Logstash 6, Kibana 5) stack with Docker and Docker Compose.
Old version is selected as Elastic Watcher in X-Pack is free to use for Elacsticseach 5 and Kibana 5, but not in the latest version.

It will give you the ability to analyze data by using the searching/aggregation capabilities of Elasticsearch
and the visualization power of Kibana.

Based on the official Docker images:

* [elasticsearch](https://github.com/elastic/elasticsearch-docker)
* [logstash](https://github.com/elastic/logstash-docker)
* [kibana](https://github.com/elastic/kibana-docker)  

And contain installation script to install metricbeat and run ELk as service using systemmd.

## Setup 

1.Clone this repository  

2.Start the ELK stack using `docker-compose`:  

```console
$ docker-compose up
```
# OR

You can also choose to run it in background (detached mode):

```console
$ docker-compose up -d
```

Give Kibana a few seconds to initialize, then access the Kibana web UI by hitting
[http://localhost:5601](http://localhost:5601) with a web browser.

the stack exposes the following ports:
* 5000: Logstash TCP input.
* **9201**: Elasticsearch HTTP
* **9301**: Elasticsearch TCP transport
* 5601: Kibana

## Run as service
```console
chmod +x setup_run.sh
./setup_run.sh
```
then there will be files:
- /usr/bin/run_elk.sh
- /lib/systemd/system/run_elk.service  

the service will be restarted as the machine restart

## Using Logstash
Logstash is commented out from docker-compose.yml, as it is not used in metricbeat by default.  
Uncomment the session to use logstash.

## Using Elastic Watcher email alert
go to /elasticsearch/config/elasticsearch.yml  
```yml
## gmail to send alert
xpack.notification.email.account:
    gmail_account:
        profile: gmail
        smtp:
            auth: true
            starttls.enable: true
            host: smtp.gmail.com
            port: 587
            user: <your email>@gmail.com
            password: <your password>
```
edit user and password  
