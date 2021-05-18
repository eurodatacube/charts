#!/usr/bin/env bash

set -eux -o pipefail

CHART=$1

NEW_VERSION=$2

./build_new_chart.sh "${CHART}" "${NEW_VERSION}"

POD_PROD_CHARTMUSEUM=`kubectl -n prod get pod | grep eox-charts-chartmuseum | awk '{ print $1 }'`
kubectl cp ./packages/${CHART}-${NEW_VERSION}.tgz prod/${POD_PROD_CHARTMUSEUM}:/storage
