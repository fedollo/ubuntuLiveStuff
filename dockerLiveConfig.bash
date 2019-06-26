#!/bin/bash
echo -n "Setting up.."
service docker stop
cat /lib/systemd/system/docker.service | sed -e "s/dockerd -H/dockerd -g \/tmp -H/" > /lib/systemd/system/docker.service.bk
cp /lib/systemd/system/docker.service.bk /lib/systemd/system/docker.service
sleep 2
systemctl daemon-reload
sleep 2
service docker restart
echo -n "..docker restarted"
