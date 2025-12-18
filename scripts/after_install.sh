#!/bin/bash

# Java 없으면 설치
if ! command -v java &> /dev/null; then
  yum install -y java-17-amazon-corretto
fi

# 앱 디렉터리 생성 및 권한 정리
mkdir -p /home/ec2-user/app
chown -R ec2-user:ec2-user /home/ec2-user/app
chmod -R 755 /home/ec2-user/app

# scripts 실행 권한 부여 (파일 존재 시점 보장)
chmod +x /home/ec2-user/app/scripts/*.sh
