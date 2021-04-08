#!/usr/bin/env bash

set -eux -o pipefail

CHART=$1

NEW_VERSION=$2


sed -i "s/version:.*$/version: ${NEW_VERSION}/" "${CHART}/Chart.yaml"
sed -i "s/appVersion:.*$/appVersion: ${NEW_VERSION}/" "${CHART}/Chart.yaml"

(cd packages && helm package "../${CHART}")

POD_PROD_CHARTMUSEUM=`kubectl -n prod get pod | grep eox-charts-chartmuseum | awk '{ print $1 }'`
kubectl cp ./packages/${CHART}-${NEW_VERSION}.tgz prod/${POD_PROD_CHARTMUSEUM}:/storage
