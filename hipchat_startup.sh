#!/bin/bash

# Passwords and stuff shouldn't be in source control.. good thing this is private!

export EXPRESS_PORT=9090
export HUBOT_HIPCHAT_JID="30164_3213923@chat.hipchat.com"
#export HUBOT_HIPCHAT_PASSWORD=""
export HUBOT_HIPCHAT_ROOMS="30164_room_99@conf.hipchat.com"
export HUBOT_JIRA_LOOKUP_USERNAME="proteus_user"
#export HUBOT_JIRA_LOOKUP_PASSWORD=""
export HUBOT_JIRA_LOOKUP_URL="https://jiradev.snap.vonagenetworks.net:8443/jiraDev"
export HUBOT_JIRA_URL="https://jiradev.snap.vonagenetworks.net:8443/jiraDev"
export HUBOT_JIRA_USERNAME="proteus_user"
#export HUBOT_JIRA_PASSWORD=""
export HUBOT_JIRA_USE_V2="true"
#export HUBOT_STANDUP_PREPEND="(standup)"
#export HUBOT_STANDUP_ROOM="296829_onboarding@conf.hipchat.com"

bin/hubot --adapter hipchat
