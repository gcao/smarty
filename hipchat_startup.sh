#!/bin/bash

# Passwords and stuff shouldn't be in source control.. good thing this is private!

export EXPRESS_PORT=9090
export HUBOT_HIPCHAT_JID="296829_2558364@chat.hipchat.com"
export HUBOT_HIPCHAT_PASSWORD="Vondroiddreamsofelectricsheep"
export HUBOT_HIPCHAT_ROOMS="296829_onboarding@conf.hipchat.com"
export HUBOT_JIRA_LOOKUP_USERNAME="proteus_user"
export HUBOT_JIRA_LOOKUP_PASSWORD="proteus"
export HUBOT_JIRA_LOOKUP_URL="https://jiradev.snap.vonagenetworks.net:8443/jiraDev/"
export HUBOT_JIRA_URL="https://jiradev.snap.vonagenetworks.net:8443/jiraDev/"
export HUBOT_JIRA_USER="proteus_user"
export HUBOT_JIRA_PASSWORD="proteus"

bin/hubot --adapter hipchat
