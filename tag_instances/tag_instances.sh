#!/bin/bash

# Get the instance name, tag key and tag value as parameters
INSTANCE_NAME=$1
TAG_KEY=$2
TAG_VALUE=$3

# Get the instance IDs of instances matching the name pattern
INSTANCE_IDS=$(aws ec2 describe-instances --filter "Name=tag:Name,Values=$INSTANCE_NAME*" --query "Reservations[*].Instances[*].InstanceId" --output text)

# If the second parameter is not provided, list all instances and their current tags
if [ -z "$TAG_KEY" ]; then
    for ID in $INSTANCE_IDS
    do
        echo "Listing tags for instance ID: $ID"
        aws ec2 describe-tags --filters "Name=resource-id,Values=$ID"
    done
elif [ -z "$TAG_VALUE" ]; then
    # If the second parameter is provided but the third is not, remove the tag from the instances
    for ID in $INSTANCE_IDS
    do
        echo "Removing tag $TAG_KEY from instance ID: $ID"
        aws ec2 delete-tags --resources $ID --tags Key=$TAG_KEY
    done
else
    # If both the second and third parameters are provided, add the tags to the instances
    for ID in $INSTANCE_IDS
    do
        echo "Adding tag $TAG_KEY=$TAG_VALUE to instance ID: $ID"
        aws ec2 create-tags --resources $ID --tags Key=$TAG_KEY,Value=$TAG_VALUE
    done
fi