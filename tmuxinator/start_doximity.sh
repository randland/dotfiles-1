#!/bin/sh

set -e
set -o pipefail

# a lot of apps rely on the docker container in doximity so keep it at top
apps=(doximity activities doc-news dotfiles)

for app in ${apps[@]}; do
  echo "Starting $app"
  tmuxinator start $app --no-attach
done

tmux attach -t doximity
