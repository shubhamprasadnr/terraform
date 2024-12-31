#!/usr/bin/env python3
import boto3
import json
import socket

# Define the region and filters for the EC2 instances
REGION = 'ap-south-1'  # Replace with your desired AWS region
PEM_KEY_PATH = 'private-key.pem'  # Path to your PEM file
TAG_NAME = 'Name'  # Tag key (we are using 'kafka' as the key)
TAG_VALUE = 'kafka'  # Tag value to filter instances (adjust as needed)

def get_local_ip():
    """Get the IP address of the local machine (host running the script)."""
    local_ip = socket.gethostbyname(socket.gethostname())
    return local_ip

def fetch_ec2_instances(local_ip):
    """Fetch EC2 instances by Kafka tag and return inventory in Ansible JSON format."""
    # Create a boto3 EC2 client
    ec2 = boto3.client('ec2', region_name=REGION)

    # Filter instances by Kafka tag (kafka=true)
    filters = [
        {
            'Name': f"tag:{TAG_NAME}",
            'Values': [TAG_VALUE]
        }
    ]
    
    # Fetch EC2 instances based on filters
    response = ec2.describe_instances(Filters=filters)

    # Initialize inventory structure
    inventory = {
        "all": {
            "hosts": [],
            "children": []
        },
        "_meta": {
            "hostvars": {}
        }
    }

    # Counter to assign labels like kafka1, kafka2, etc.
    label_counter = 1

    # Loop through each reservation to get instance details
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            # Check if the instance has a public IP
            if 'PublicIpAddress' in instance:
                public_ip = instance['PublicIpAddress']
                
                # Exclude the local machine's IP address
                if public_ip != local_ip:
                    # Assign a label like kafka1, kafka2, etc.
                    label = f"kafka{label_counter}"
                    
                    # Add the label to the hosts list
                    inventory['all']['hosts'].append(label)
                    
                    # Add host variables (like the SSH key file and IP)
                    inventory["_meta"]["hostvars"][label] = {
                        "ansible_host": public_ip,
                        "ansible_ssh_private_key_file": PEM_KEY_PATH
                    }
                    label_counter += 1

    return inventory

def main():
    # Get the local machine's IP address (to avoid including it)
    local_ip = get_local_ip()
    
    # Fetch the EC2 instance inventory based on Kafka tags
    inventory = fetch_ec2_instances(local_ip)
    
    # Output the inventory in JSON format for Ansible to consume
    print(json.dumps(inventory, indent=2))

if __name__ == "__main__":
    main()
