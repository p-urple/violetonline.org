#!/bin/bash

tmux \
    new-session  -s "violetonline" -n "git" 'vim misc/nginx.conf'\; \
    split-window -h \; \
    resize-pane -R 35 \; \
    new-window -n "servers" 'ssh -t matchbox.local "cd /var/dev/violetonline.org ; sudo su ; zsh --login"' \; \
    split-window -h 'ssh -t matchbox.local "cd /var/www/violetonline.org ; sudo su ; zsh --login"' \; \
    detach-client
