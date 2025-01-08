pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key')  // AWS credentials (for EC2 access)
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')  // AWS credentials (for EC2 access)
    }
    
    stages {
        stage('git checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/YugeshKumar01/kafka_roles-Dynamic_inventory.git'
            }
        }
    
        stage('ansible version') {
            steps {
                sh 'ansible --version'
            }
        }
        
        stage('run kafka role') {
            steps {
                withCredentials([file(credentialsId: 'key-cred', variable: 'SSH_PRIVATE_KEY')]) {
                    // Ensure the private key has 400 permissions
                    sh 'chmod 400 $SSH_PRIVATE_KEY'
                    // Specify the correct SSH user (e.g., "ubuntu" for Ubuntu-based EC2 instances)
                    sh 'ansible all -i aws_ec2.yml -u ubuntu -m ping --private-key $SSH_PRIVATE_KEY'
                    // Run the Kafka Ansible playbook with the Kafka role applied
                    sh 'ansible-playbook -i aws_ec2.yml kafka_playbook.yml --private-key $SSH_PRIVATE_KEY'
                    //sh 'ansible-playbook -i aws_ec2.yml kafka_playbook.yml --private-key $SSH_PRIVATE_KEY -vvv'

                }
            }
        }
    }
}
