#!/bin/bash

echo "▶️ 현재 사용자: $(whoami)"
echo "▶️ 현재 홈 디렉토리: $HOME"

if [ "$(whoami)" = "root" ]; then
  echo "🧭 현재 사용자가 root입니다. ec2-user로 전환하여 deploy.sh 실행합니다."

  sudo -u ec2-user bash -c "/home/ec2-user/rpSample/deploy.sh"
  exit 0
fi

cd /home/ec2-user/rpSample || exit 1

echo "git pull..."
git pull origin master

JAR_PATH=build/libs/rpSample-0.0.1-SNAPSHOT.jar

if [ ! -f "$JAR_PATH" ]; then
  echo "JAR file not found at $JAR_PATH"
  exit 1
fi

chmod 755 "$JAR_PATH"
chown ec2-user:ec2-user "$JAR_PATH"

PID=$(pgrep -u ec2-user -f "java -jar $JAR_PATH")
if [ -n "$PID" ]; then
  echo "Stopping existing app (PID: $PID)..."
  kill "$PID"
  sleep 3
fi

echo "Starting app..."
nohup java -jar "$JAR_PATH" > app.log 2>&1 &
echo "Deploy complete."
