#!/bin/bash

ENV GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

if [ -n "$SSH_KEY" ] ; then
    eval $(ssh-agent -s)
    echo "$SSH_KEY" | ssh-add - > /dev/null
fi

if [ -n "$SSH_FILE" ] ; then
    eval $(ssh-agent -s)
    cat $SSH_FILE | ssh-add - > /dev/null
fi

composer "$@"