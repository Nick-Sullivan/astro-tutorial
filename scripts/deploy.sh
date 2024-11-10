#!/bin/bash
SCRIPT_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")")
ASTRO_DIR="$SCRIPT_DIR/../astro"

echo "Deploying website"

aws s3 sync $ASTRO_DIR/dist/ s3://nicksastroexperiment.com/ --delete
