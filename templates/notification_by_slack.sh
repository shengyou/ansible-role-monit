#!/bin/bash

URL="{{ slack_hook_url }}"

MONIT_EVENT=$1
MONIT_HOST="{{ ansible_hostname }}"
MONIT_DATE=$(date -R)

COLOR=${MONIT_COLOR:-$([[ $MONIT_EVENT == *"succeeded"* ]] && echo good || echo danger)}
TEXT=$(echo -e "$MONIT_EVENT" | python3 -c "import json,sys;print(json.dumps(sys.stdin.read()))")

PAYLOAD="{
  \"attachments\": [
    {
      \"text\": $TEXT,
      \"color\": \"$COLOR\",
      \"mrkdwn_in\": [\"text\"],
      \"fields\": [
        { \"title\": \"Date\", \"value\": \"$MONIT_DATE\", \"short\": true },
        { \"title\": \"Host\", \"value\": \"$MONIT_HOST\", \"short\": true }
      ]
    }
  ]
}"

curl -s -X POST --data-urlencode "payload=$PAYLOAD" $URL
