#!/bin/sh
apt update
sleep 5
apt-get upgrade -y
sleep 5
apt install -y ruby-full ruby-bundler build-essential
