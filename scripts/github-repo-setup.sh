#!/bin/bash

# List of repositories to create locally
REPOS=(
    "blinkdrive-authentication"
    "blinkdrive-application"
    "blinkdrive-database"
    "blinkdrive-storage-node"
    "blinkdrive-backend"
    "blinkdrive-frontend"
    "blinkdrive-devops"
    # "blinkdrive-documentation"
)

# Your GitHub organization name
ORG_NAME="BlinkDriveHQ"

# Loop through each repository
for REPO in "${REPOS[@]}"; do
    echo "Setting up local repository for $REPO..."
    
    # Create local repository
    mkdir -p "$REPO"
    cd "$REPO"
    
    # Initialize Git repository
    git init
    
    # Create README file
    echo "# $REPO" > README.md
    git add README.md
    git commit -m "Initial commit"
    
    # Add remote origin
    git remote add origin "https://github.com/$ORG_NAME/$REPO.git"
    
    # Detect default branch (master or main)
    DEFAULT_BRANCH=$(git ls-remote --symref origin HEAD | awk -F'/' '/^ref/ {print $NF}')
    if [ -z "$DEFAULT_BRANCH" ]; then
        # If not detected, assume 'master' as default
        DEFAULT_BRANCH="master"
    fi
    
    echo "Default branch detected: $DEFAULT_BRANCH"
    
    # Create and push default branch
    git checkout -b "$DEFAULT_BRANCH"
    git push -u origin "$DEFAULT_BRANCH"
    
    # Create and push development branch
    git checkout -b development
    git push -u origin development
    
    # Return to parent directory
    cd ..
    
    echo "Local repository for $REPO setup complete!"
done