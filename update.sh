#!/bin/sh

set -eux

users=(
  milahu
)

for user in "${users[@]}"; do
  ./hypothesis-annotations-scraper/hypothesis-annotations-scraper.sh $user
  mv $user.*.json hypothesis-annotations.$user.json
  cat hypothesis-annotations.$user.json | jq | sponge hypothesis-annotations.$user.json
  git add hypothesis-annotations.$user.json
done

git commit -m up
