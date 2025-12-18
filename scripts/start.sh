#!/bin/bash
set -e

APP_DIR=/home/ec2-user/app
cd $APP_DIR

echo "[Start] Starting application..."

nohup java -jar build/libs/*.jar >> app.log 2>&1 &

sleep 3
echo "[Start] Application started"
