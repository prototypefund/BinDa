#!/bin/bash

DOCKER=$(which docker)

UIID=$(${DOCKER} images |grep binda_ui|awk '{print $3}')
if [[ ! -z "${UIID}" ]]; then
  docker rmi "${UIID}"
fi

APIID=$(${DOCKER} images |grep binda_api|awk '{print $3}')
if [[ ! -z "${APIID}" ]]; then
  docker rmi "${APIID}"
fi
