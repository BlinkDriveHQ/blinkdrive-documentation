# Github Commit Standards

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
- merge: merge with other branches only

## Examples

### Feature implementation from User Story

feat(US-123): add login functionality
Add authentication endpoint and session management
Refs #123

### Bug fix from Sprint Backlog

fix(TASK-456): prevent duplicate submissions
Fix form submission race condition
Refs #456

### Technical improvement

perf(STORY-789): optimize database queries
Reduce query time by implementing indexing
Refs #789

### Merging

#### Option 1: Using --no-ff to force a merge commit

git merge feature/login -m "merge(feature/login): Integrate login functionality" --no-ff

#### Option 2: Using --no-commit to review before committing

git merge feature/login --no-commit
git commit -m "merge(feature/login): Integrate login functionality
• Added authentication endpoint
• Implemented session management
Refs #123"

## Refs

- <https://www.gitkraken.com/learn/git/best-practices/git-commit-message>
- <https://www.theserverside.com/video/Follow-these-git-commit-message-guidelines>
- <https://www.conventionalcommits.org/en/v1.0.0/>
- <https://stackoverflow.com/questions/15324900/>
- <https://stackoverflow.com/questions/15324900/standard-to-follow-when-writing-git-commit-messages>
