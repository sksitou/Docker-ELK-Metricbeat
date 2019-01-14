if cat run_elk.sh | grep 'sudo docker-compose'; then
    echo docker-compose already configured
else
    echo sudo docker-compose -f $PWD/docker-compose.yml up >> run_elk.sh
fi
sudo cp run_elk.sh /usr/bin/run_elk.sh
sudo cp run_elk.service /lib/systemd/system/run_elk.service
sudo chmod +x /usr/bin/run_elk.sh
sudo systemctl daemon-reload
sudo systemctl start run_elk && sudo systemctl status run_elk -l
sudo systemctl enable run_elk
#sudo journalctl -u run_elk | tail -f
