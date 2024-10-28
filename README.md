# Midjourney API

集成 <https://github.com/novicezk/midjourney-proxy> 的 API 服务

8080 全局改为 9300

配置 docker-compose.yml

Midjourney-Proxy 配置信息在 config/application.yml 中

全局 this.account.setEnable(false); 注释掉

定期 docker compose restart 一下，清除内存数据

设置 1分钟 定时任务
