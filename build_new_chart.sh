#!/usr/bin/env bash

set -eux -o pipefail

CHART=$1

NEW_VERSION=$2
NEW_APP_VERSION=$3

sed -i "s/version:.*$/version: ${NEW_VERSION}/" "${CHART}/Chart.yaml"
sed -i "s/appVersion:.*$/appVersion: ${NEW_APP_VERSION}/" "${CHART}/Chart.yaml"

(cd packages && helm package "../${CHART}")
