#! /bin/bash

os=$( awk -F= '/^NAME/{print $2}' /etc/os-release )
USER=$( whoami )
echo $os
if [[ $USER != 'root' ]]; then
    echo Current user must be root.
    exit -1
fi

file = "metricbeat-6.5.1-amd64.deb"
if [ ! -f "$file"]
then
    curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-6.5.1-amd64.deb
    sudo dpkg -i metricbeat-6.5.1-amd64.deb
fi
sudo metricbeat modules enable apache mysql
sudo cp metricbeat.yml /etc/metricbeat/metricbeat.yml
sudo chmod go-w /etc/metricbeat/metricbeat.yml

while true; do
    read -p "Do you wish to start metricbeat right now?" yn
    case $yn in
        [Yy]* ) sudo metricbeat -e; break;;
        [Nn]* ) echo "Type: \"sudo metricbeat -e\" to start metricbeat"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

