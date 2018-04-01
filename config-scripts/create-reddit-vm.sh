#!/bin/bash

set -e

gcloud compute instances create --image=reddit-full-1522416760 reddit-full --tags=puma-server --machine-type=g1-small
