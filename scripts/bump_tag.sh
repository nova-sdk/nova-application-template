#!/bin/bash

git fetch --tags

latest_tag=$(git describe --tags $(git rev-list --tags --max-count=1))

IFS='.' read -r -a parts <<< "${latest_tag}"
((parts[1]++))

new_tag="${parts[0]}.${parts[1]}"

echo -n $new_tag
