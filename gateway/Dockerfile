FROM docker.io/library/krakend:2.13.10@sha256:7b0f2adaab1222191bde302ea61f4e2ab1bf322b00075d337ee6ab98c3a72656

COPY krakend.template.json /etc/krakend/krakend.template.json
COPY entrypoint.sh /usr/local/bin/railway-krakend-entrypoint
RUN chmod +x /usr/local/bin/railway-krakend-entrypoint \
    && sed 's|__BACKEND_URL__|http://echo:8081|g' /etc/krakend/krakend.template.json > /tmp/krakend-build.json \
    && krakend check -c /tmp/krakend-build.json

ENV USAGE_DISABLE=1
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/railway-krakend-entrypoint"]
