#!/bin/bash

tmux \
    new-session  -s "violetonline" -n "git" 'vim misc/nginx.conf'\; \
    split-window -h \; \
    resize-pane -R 35 \; \
    new-window -n "servers" 'cd /var/dev/violetonline.org; sudo su' \; \
    split-window -h 'cd /var/www/violetonline.org; sudo su' \; \
    detach-client
