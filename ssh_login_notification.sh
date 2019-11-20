#!/bin/bash

# Get notification for every SSH login activity in Flock Channel
# Simple bash script by Fa Fajrin

if [[ "$PAM_TYPE" != "open_session" ]]; then
        exit 0
fi

hostname=`hostname`
group=`groups`

curl -X POST "https://yourflockwebhookurl" \
     -H "Content-Type: application/json" \
     -d '{"text" : "SSH Login - '$PAM_USER'@'$hostname' login on from '$PAM_RHOST'. '$PAM_USER' is the member of group: '$group'"}'