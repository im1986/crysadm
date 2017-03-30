#!/bin/bash
echo 'Stop crysadm on'  $(date) >> /tmp/crysadm.txt

pkill redis-server
pkill python3.4

