import os
import boto3
AWS_ACCOUNT_ID = os.environ['AWS_ACCOUNT_ID']
REGION = os.environ['AWS_REGION']

def scale_down(event, context):
    client = boto3.client('eks')

    clusters_response = client.list_clusters()
    cluster_names = clusters_response['clusters']

    for cluster_name in cluster_names:
        # Get tags for each cluster
        cluster_tags_response = client.list_tags_for_resource(
            resourceArn=f'arn:aws:eks:{REGION}:{AWS_ACCOUNT_ID}:cluster/{cluster_name}'
        )
        cluster_tags = cluster_tags_response['tags']

        # If the 'env' tag does not have a value of 'prod', scale down the associated nodegroups
        if cluster_tags.get('env') != 'prod':
            nodegroups_response = client.list_nodegroups(clusterName=cluster_name)
            nodegroups = nodegroups_response['nodegroups']

            for nodegroup in nodegroups:
                response = client.update_nodegroup_config(
                    clusterName=cluster_name,
                    nodegroupName=nodegroup,
                    scalingConfig={
                        'minSize': 0,
                        'maxSize': 1,
                        'desiredSize': 0
                    }
                )
    return {
        'statusCode': 200,
        'body': 'Nodegroups in non-prod clusters scaled down successfully'
    }