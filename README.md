# nginx-forward-proxy
nginx 正向代理

```
docker run   -e DNS=114.114.114.114  -e PORT=333  --net host --rm  -d  -v /data/nginx_proxy_logs:/var/log/nginx/ momo184/nginx-forward-proxy:latest
```
