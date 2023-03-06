#!/usr/bin/env bash

set -eux -o pipefail

APP_DIR=$1

APP=$(basename $APP_DIR)

cd ${APP_DIR}

helm list --all --all-namespaces | grep $APP | awk '{print $1 " " $2}' | while read HELM_INSTALL ; do
    RELEASE_NAME=$(echo $HELM_INSTALL | cut -d' ' -f1)
    NAMESPACE=$(echo $HELM_INSTALL | cut -d' ' -f2)
    helm -n $NAMESPACE upgrade $RELEASE_NAME . --reuse-values
    echo
done




