#!/usr/bin/env bash

set -eux -o pipefail

CHART=$1

NEW_VERSION=$2
NEW_APP_VERSION=$3

./build_new_chart.sh "${CHART}" "${NEW_VERSION}" "${NEW_APP_VERSION}"

CHART_BASENAME=`basename $CHART`

POD_PROD_CHARTMUSEUM=`kubectl -n prod get pod | grep edc-charts-chartmuseum | awk '{ print $1 }'`
kubectl cp ./packages/${CHART_BASENAME}-${NEW_VERSION}.tgz prod/${POD_PROD_CHARTMUSEUM}:/storage

POD_DEV_CHARTMUSEUM=`kubectl -n dev get pod | grep edc-charts-chartmuseum | awk '{ print $1 }'`
kubectl cp ./packages/${CHART_BASENAME}-${NEW_VERSION}.tgz dev/${POD_DEV_CHARTMUSEUM}:/storage
