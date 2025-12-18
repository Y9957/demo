#!/bin/bash
cd /home/ec2-user/app

nohup java -jar build/libs/*.jar > app.log 2>&1 &
