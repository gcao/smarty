#!/bin/bash

export EXPRESS_PORT=9090
export HUBOT_HIPCHAT_JID=""
export HUBOT_HIPCHAT_PASSWORD=""
export HUBOT_HIPCHAT_ROOMS=""
export HUBOT_JIRA_LOOKUP_USERNAME="proteus_user"
export HUBOT_JIRA_LOOKUP_PASSWORD="proteus"
export HUBOT_JIRA_LOOKUP_URL="https://jiradev.snap.vonagenetworks.net:8443/jiraDev/"
export HUBOT_JIRA_URL="https://jiradev.snap.vonagenetworks.net:8443/jiraDev/"
export HUBOT_JIRA_USER="proteus_user"
export HUBOT_JIRA_PASSWORD="proteus"

bin/hubot --adapter hipchat
