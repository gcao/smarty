#!/bin/bash

export EXPRESS_PORT=9090
export HUBOT_HIPCHAT_JID=""
export HUBOT_HIPCHAT_PASSWORD=""
export HUBOT_HIPCHAT_ROOMS=""

bin/hubot --adapter hipchat
