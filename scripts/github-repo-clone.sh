#!/bin/bash
# GitHub organization name
ORG_NAME="BlinkDriveHQ"

# List of repositories to clone
REPOS=(
    "blinkdrive-authentication"
    "blinkdrive-application"
    "blinkdrive-database"
    "blinkdrive-storage-node"
    "blinkdrive-backend"
    "blinkdrive-frontend"
    "blinkdrive-devops"
    "blinkdrive-documentation"
)

# Create a directory for all repos (optional)
mkdir -p BlinkDrive
cd BlinkDrive

# Clone each repository
for REPO in "${REPOS[@]}"; do
    echo "Cloning $REPO..."
    git clone https://github.com/$ORG_NAME/$REPO.git

    # Setup both branches
    cd $REPO
    git checkout development
    cd ..

    echo "Repository $REPO cloned successfully!"
done