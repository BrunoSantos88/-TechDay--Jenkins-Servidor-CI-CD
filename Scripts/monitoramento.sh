#!/bin/bash
sudoapt-get install -y apt-transport-https
sudo apt-get install -y software-properties-common wget
sudo wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo echo "deb https://packages.grafana.com/enterprise/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install grafana-enterprise -y
sudo systemctl start grafana-server
##Prometheus
sudo apt-get update
sudo apt-get install prometheus -y
sudo systemctl start prometheus
