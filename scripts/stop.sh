#!/bin/bash

echo "[Stop] Stopping application..."

PID=$(pgrep -f "java -jar")

if [ -z "$PID" ]; then
  echo "No running application"
  exit 0
fi

kill -15 $PID
sleep 5

if ps -p $PID > /dev/null; then
  echo "Force killing application"
  kill -9 $PID
fi

echo "[Stop] Application stopped"
