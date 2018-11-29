#!/bin/bash

if [ -n "$SSH_KEY" ] ; then
    eval $(ssh-agent -s)
    echo "$SSH_KEY" | tr -d '\r' | ssh-add - > /dev/null
fi

if [ -n "$SSH_FILE" ] ; then
    eval $(ssh-agent -s)
    cat $SSH_FILE | tr -d '\r' | ssh-add - > /dev/null
fi

composer "$@"