#!/bin/bash

# Deploy stack to Docker Swarm
STACK_NAME="dht22_stack"

docker build -t $github_user/dht22_project:latest .
docker stack deploy -c docker-compose.yml $STACK_NAME

echo "Stack $STACK_NAME deployed!"
EOF

chmod +x swarm-deploy.sh

echo "swarm-deploy.sh script created, but not executed. Run './swarm-deploy.sh' to deploy."

# Add initial files to Git
git add .
git commit -m "Initial commit: DHT22 Project setup"

git branch -M main
git push -u origin main

# Done
echo "Project setup and GitHub push complete!"

