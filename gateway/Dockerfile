FROM docker.io/library/krakend:3.0.0@sha256:e93eed25554145dc4f2727d203e96c655bd2e609459f05e13afcbf590582496f

COPY krakend.template.json /etc/krakend/krakend.template.json
COPY entrypoint.sh /usr/local/bin/railway-krakend-entrypoint
RUN chmod +x /usr/local/bin/railway-krakend-entrypoint \
    && sed 's|__BACKEND_URL__|http://echo:8081|g' /etc/krakend/krakend.template.json > /tmp/krakend-build.json \
    && krakend check -c /tmp/krakend-build.json

ENV USAGE_DISABLE=1
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/railway-krakend-entrypoint"]
