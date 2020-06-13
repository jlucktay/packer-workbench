#!/usr/bin/env bash
set -euxo pipefail

export CLOUDSDK_CORE_PROJECT=jlucktay-sandbox

image_name="ubuntu-2004-lts-without-snaps-$(TZ=UTC date +%Y%m%d-%H%M%S)"

packer \
  build \
  -timestamp-ui \
  -var "image_name=$image_name" \
  -var 'image_zone=us-east1-d' \
  -var "project_id=$CLOUDSDK_CORE_PROJECT" packer.json
