#!/bin/bash
cd /home/appuser && git clone -b monolith https://github.com/express42/reddit.git
sleep 3
cd reddit && bundle install
sleep 3
puma -d
sleep 3
ps aux | grep puma
