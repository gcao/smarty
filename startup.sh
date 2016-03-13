#!/bin/bash

# while true; do ./startup.sh; sleep 1; done
# Passwords and stuff shouldn't be in source control.. good thing this is private!

export EXPRESS_PORT=${EXPRESS_PORT:-9090}

export HUBOT_ADAPTER=${HUBOT_ADAPTER:-hipchat}
#export HUBOT_LOG_LEVEL=debug

export HUBOT_HIPCHAT_JID=${HUBOT_HIPCHAT_JID:-30164_3213923@chat.hipchat.com}
export HUBOT_HIPCHAT_ROOMS=${HUBOT_HIPCHAT_ROOMS:-30164_room_99@conf.hipchat.com,30164_room_98@conf.hipchat.com}

export STOMP_SERVER=${STOMP_SERVER:-subscribe-vm-06.dloco.s.vonagenetworks.net}
export STOMP_PORT=${STOMP_PORT:-61613}
export STOMP_USERNAME=${STOMP_USERNAME:-admin}
export STOMP_PASSWORD=${STOMP_PASSWORD:-admin}

bin/hubot --adapter $HUBOT_ADAPTER
