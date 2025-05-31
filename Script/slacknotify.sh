#!/bin/bash

SLACK_WEBHOOK_URL="https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
MESSAGE="✅ Database migration completed successfully."

curl -X POST -H 'Content-type: application/json' \
    --data "{\"text\":\"$MESSAGE\"}" \
    $SLACK_WEBHOOK_URL
