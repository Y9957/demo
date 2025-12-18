#!/bin/bash

PID=$(pgrep -f bookmuseum)

if [ -z "$PID" ]; then
  echo "No running application"
else
  echo "Stopping application with PID $PID"
  kill -9 $PID
fi