#!/bin/bash

cat >> /etc/docker/daemon.json <<EOF
{
    "registry-mirrors": ["https://docker.iranserver.com"]
}
EOF
