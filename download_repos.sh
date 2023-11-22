#!/bin/bash

# Check if ORG variable is provided
if [ -z "$1" ]; then
  echo "Please provide the ORG variable."
  exit 1
fi

ORG=$1

gh repo list "$ORG" --limit 100 | while read -r repo _; do
  gh repo clone "$repo" "$repo"
done
