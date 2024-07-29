#!/bin/bash

# Usage: ./scale_instance.sh <auto_scaling_group_name> <desired_capacity>
ASG_NAME=$1
DESIRED_CAPACITY=$2

if [ -z "$ASG_NAME" ] || [ -z "$DESIRED_CAPACITY" ]; then
  echo "Usage: $0 <auto_scaling_group_name> <desired_capacity>"
  exit 1
fi

aws autoscaling update-auto-scaling-group --auto-scaling-group-name $ASG_NAME --desired-capacity $DESIRED_CAPACITY
echo "Updated auto-scaling group $ASG_NAME to desired capacity $DESIRED_CAPACITY"
