#!/bin/bash

tmux \
    new-session  -s "violetonline" -n "git" 'vim misc/nginx.conf'\; \
    split-window -h \; \
    resize-pane -R 35 \; \
    new-window -n "servers" 'sudo su ; cd /var/dev/violetonline.org' \; \
    split-window -h 'sudo su ; cd /var/www/violetonline.org' \; \
    detach-client
