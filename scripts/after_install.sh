#!/bin/bash
set -e

APP_DIR=/home/ec2-user/app

echo "[AfterInstall] Start"

# Java 설치 (없으면)
if ! command -v java &>/dev/null; then
  echo "Installing Java 17..."
  yum install -y java-17-amazon-corretto
fi

# 앱 디렉토리 준비
mkdir -p $APP_DIR
touch $APP_DIR/app.log

# 권한 정리 (🔥 핵심)
chown -R ec2-user:ec2-user $APP_DIR
chmod -R 755 $APP_DIR
chmod 664 $APP_DIR/app.log

# 스크립트 실행권한
chmod +x $APP_DIR/scripts/*.sh

echo "[AfterInstall] Done"
