#!/bin/bash
sudo cp -v conf/filebeat.yml /etc/filebeat/filebeat.yml
sudo systemctl restart filebeat
