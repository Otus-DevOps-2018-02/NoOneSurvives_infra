#!/bin/bash
set -e
cd /home/appuser && git clone -b monolith https://github.com/express42/reddit.git
sleep 3
cd reddit && bundle install
