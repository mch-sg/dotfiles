#!/bin/bash
cd "/Users/mhvidtfeldt/dtu"
git add .
if ! git diff --cached --quiet; then
    git commit -m "git-$(date +"%d-%m-%y-%I:%M-%p" | tr '[:upper:]' '[:lower:]')"
    git push
else
    echo "No changes to commit."
fi
