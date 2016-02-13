#!/bin/bash
# while true; do ./run.sh; sleep 1; done

export EXPRESS_PORT=${EXPRESS_PORT:-9090}

export HUBOT_JIRA_LOOKUP_USERNAME="proteus_user"
#export HUBOT_JIRA_LOOKUP_PASSWORD=""
export HUBOT_JIRA_LOOKUP_URL="https://jiradev.snap.vonagenetworks.net:8443/jiraDev"
export HUBOT_JIRA_URL="https://jiradev.snap.vonagenetworks.net:8443/jiraDev"
export HUBOT_JIRA_USERNAME="proteus_user"
#export HUBOT_JIRA_PASSWORD=""
export HUBOT_JIRA_USE_V2="true"

export HUBOT_JENKINS_URL=http://subscribe-vm-06.dloco.s.vonagenetworks.net:8080/

export AMQP_SERVER=${AMQP_SERVER:-subscribe-vm-06.dloco.s.vonagenetworks.net}
export AMQP_USERNAME=${AMQP_USERNAME:-guest}
export AMQP_PASSWORD=${AMQP_PASSWORD:-guest}
export AMQP_URL=amqp://$AMQP_USERNAME:$AMQP_PASSWORD@$AMQP_SERVER

# https://my.slack.com/services/new/hubot
#export HUBOT_SLACK_TOKEN=XYZ

bin/hubot --adapter slack
