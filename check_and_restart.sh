#!/bin/bash

# 定义容器名称
CONTAINER_NAME="midjourney-proxy"
# 定义日志文件路径
LOG_FILE="/home/spring/logs/spring.log"
# 定义关键字
KEYWORDS="Account disabled|当前可用账号数 \[0\]|Remote host terminated the handshake|HTTP method names must be tokens"

# 检查容器日志中的关键字
if sudo docker logs $CONTAINER_NAME 2>&1 | grep -E "$KEYWORDS"; then
  # 如果匹配到关键字，则删除日志并重启 Docker 容器
  CONTAINER_LOG_PATH=$(sudo docker inspect --format='{{.LogPath}}' "$CONTAINER_NAME")
  sudo truncate -s 0 "$CONTAINER_LOG_PATH"

  cd /home/ubuntu/new-midjourney-api
  sudo docker compose restart $CONTAINER_NAME
fi
