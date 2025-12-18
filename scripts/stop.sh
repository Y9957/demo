#!/bin/bash

PID=$(pgrep -f 'java -jar')

if [ -n "$PID" ]; then
  kill -15 $PID
fi
