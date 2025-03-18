# blinkdrive-documentation

## Github Repo Setup

```bash
    #!/bin/bash

    # List of repositories to create locally
    REPOS=(
    "blinkdrive-authentication"
    "blinkdrive-application"
    "blinkdrive-database"
    "blinkdrive-storage-node"
    "blinkdrive-client-web"
    "blinkdrive-devops"
    "blinkdrive-documentation"
    )

    # Your GitHub organization name
    ORG_NAME="BlinkDriveHQ"

    # Loop through each repository
    for REPO in "${REPOS[@]}"
    do
    echo "Setting up local repository for $REPO..."
    
    # Create local repository
    mkdir -p $REPO
    cd $REPO
    git init
    
    # Create README file
    echo "# $REPO" > README.md
    git add README.md
    git commit -m "Initial commit"
    
    # Add remote origin
    git remote add origin https://github.com/$ORG_NAME/$REPO.git

    # Detect default branch (master or main)
    DEFAULT_BRANCH=$(git ls-remote --symref origin HEAD | awk -F'/' '/^ref/ {print $NF}')

    if [ -z "$DEFAULT_BRANCH" ]; then
        # Si no se detecta, asumimos 'main' por defecto
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
```

## GitHub Commit Message Standard

```md
    ## Structure 

    [type]([scope]): [subject]
    [optional body]
    [optional footer]

    ## Commit Types

    - feat: New feature implementation
    - fix: Bug fix
    - docs: Documentation changes
    - style: Code formatting
    - refactor: Code structure improvements
    - perf: Performance optimizations
    - test: Test additions
    - chore: Other changes

    ## Examples

    # Feature implementation from User Story
    feat(US-123): add login functionality
    Add authentication endpoint and session management
    Refs #123

    # Bug fix from Sprint Backlog
    fix(TASK-456): prevent duplicate submissions
    Fix form submission race condition
    Refs #456

    # Technical improvement
    perf(STORY-789): optimize database queries
    Reduce query time by implementing indexing
    Refs #789

    # Refs

    - https://www.gitkraken.com/learn/git/best-practices/git-commit-message
    - https://www.theserverside.com/video/Follow-these-git-commit-message-guidelines
    - https://www.conventionalcommits.org/en/v1.0.0/
    - https://stackoverflow.com/questions/15324900/
    - https://stackoverflow.com/questions/15324900/standard-to-follow-when-writing-git-commit-messages

```
