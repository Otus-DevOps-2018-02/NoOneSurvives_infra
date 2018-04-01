#!/bin/bash

set -e

sudo cp /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl start puma.service
sudo systemctl enable puma.service
