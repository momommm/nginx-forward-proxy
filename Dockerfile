FROM alpine:3.13
MAINTAINER "guozhipeng guozhipeng@mu77.com"
COPY ngx_http_proxy_connect_module-0.0.2.tar.gz /tmp/
COPY entrypoint.sh /entrypoint.sh
COPY nginx.conf /templates/
RUN cd /tmp/ \
    && wget http://nginx.org/download/nginx-1.19.6.tar.gz \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add patch gcc g++ pcre-dev zlib-dev make\
    && tar zxf ngx_http_proxy_connect_module-0.0.2.tar.gz \
    && tar zxf nginx-1.19.6.tar.gz \
    && cd nginx-1.19.6 \
    && patch -p1 < /tmp/ngx_http_proxy_connect_module-0.0.2/patch/proxy_connect_rewrite_1018.patch \
    && ./configure --add-module=/tmp/ngx_http_proxy_connect_module-0.0.2/ \
    && make && make install \
    && rm -rf /tmp/* \
    && mkdir /var/log/nginx/
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
