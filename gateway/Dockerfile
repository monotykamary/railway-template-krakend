FROM docker.io/library/krakend:2.13.11@sha256:87453dd2f93d42d5b8d0c4dd82b68427ee28fb061c9d51571990383cac7fed62

COPY krakend.template.json /etc/krakend/krakend.template.json
COPY entrypoint.sh /usr/local/bin/railway-krakend-entrypoint
RUN chmod +x /usr/local/bin/railway-krakend-entrypoint \
    && sed 's|__BACKEND_URL__|http://echo:8081|g' /etc/krakend/krakend.template.json > /tmp/krakend-build.json \
    && krakend check -c /tmp/krakend-build.json

ENV USAGE_DISABLE=1
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/railway-krakend-entrypoint"]
