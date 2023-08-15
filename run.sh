#!/bin/bash

FOLDER=/data
EMAIL="dirk@hohndel.org"
max=85%

used=$(df -Ph "${FOLDER}" | awk {'print $5'} | tail -1)
if [[ ${used%?} -ge ${max%?} ]]; then

    /usr/sbin/ssmtp "${EMAIL}" <<HEREDOC
From: "${EMAIL}"
To: "${EMAIL}"
Subject: $(hostname) disk storage at ${used}

Make sure to clean up stuff before the service stops.


HEREDOC

fi
