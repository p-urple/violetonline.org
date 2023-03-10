#!/bin/bash

tmux \
    new-session  -s "test" -n "git" 'vim misc/nginx.conf'\; \
    split-window -h \; \
    resize-pane -R 35 \; \
    new-window -n "servers" 'ssh -t matchbox.local "cd /var/dev ; sudo su ; zsh --login"' \; \
    split-window -h 'ssh -t matchbox.local "cd /var/www ; sudo su ; zsh --login"' \; \
    detach-client
