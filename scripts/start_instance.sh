#!/bin/bash

# Usage: ./start_instance.sh <instance_id>
INSTANCE_ID=$1

if [ -z "$INSTANCE_ID" ]; then
  echo "Usage: $0 <instance_id>"
  exit 1
fi

aws ec2 start-instances --instance-ids $INSTANCE_ID
echo "Started instance $INSTANCE_ID"
