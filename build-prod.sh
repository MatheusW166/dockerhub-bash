#!/bin/bash

# Build the image and push it to Docker Hub

export REP=your_dockerhub_repo/your_image_name
export VERSION=$(docker image ls -a | grep $REP | awk '{print $2}' | sort -V | grep -v latest | tail -n 1)
export VERSION=$(echo ${VERSION:-0.9} + 0.1 | bc)

echo "Building image $REP:$VERSION"
docker build -t $REP:$VERSION -t $REP:latest . && 
echo "✅ Building completed!"

echo "Pushing to dockerhub..."
docker push $REP:$VERSION &&
docker push $REP:latest
echo "🚀 Pushed to dockerhub! $REP:$VERSION and $REP:latest"

echo "Cleaning up..."
docker image prune -f
docker volume prune -f
docker network prune -f
echo "Done!"