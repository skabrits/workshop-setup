#!/bin/bash

sed -i "s/Port 2222/Port ${SSH_PORT}/g" /etc/ssh/sshd_config