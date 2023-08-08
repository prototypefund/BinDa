#!/bin/bash -x

DOCKER=$(which docker)

function delete_image () {
  IMAGE_KEY=$1
  if [[ ! -z "${IMAGE_KEY}" ]]; then
    if [[ "${IMAGE_KEY}" == "API" ]]; then
      IMAGE_NAME="binda_api"
    elif [[ "${IMAGE_KEY}" == "UI" ]]; then
      IMAGE_NAME="binda_ui"
    fi

    if [[ ! -z "${IMAGE_NAME}" ]]; then
      IMAGE_ID=$(${DOCKER} images |grep "${IMAGE_NAME}"|awk '{print $3}')
      if [[ ! -z "${IMAGE_ID}" ]]; then
        docker rmi "${IMAGE_ID}"
      fi
    else
      echo "invalid image key, not 'API' or 'UI'"
    fi
  fi
}

KEY=$1

if [[ ! -z "${KEY}" ]]; then
  delete_image "${KEY}"
else
  echo "usage: $0 {API|UI}"
fi