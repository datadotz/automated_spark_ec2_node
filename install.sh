#!/bin/bash
yum update -y
yum install wget gcc gcc-c++ python-devel -y
yum --enablerepo=epel install ansible -y
pip install boto3
cd /tmp
mkdir -p /tmp/datadotz
cd /tmp/datadotz
aws s3 cp s3://datadotz-infracodes/ansible/test/spark.yml ./
ansible-playbook spark.yml -i "localhost," -e "" --connection local > playbook.log
