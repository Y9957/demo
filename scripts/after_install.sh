#!/bin/bash

# Java 없으면 설치
if ! command -v java &> /dev/null; then
  yum install -y java-17-amazon-corretto
fi

# 실행 권한 보장
chmod +x /home/ec2-user/app/scripts/*.sh
