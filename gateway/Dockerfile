FROM docker.io/library/krakend:2.13.9@sha256:4f78e4e10cdcc077f35e760525724a68a39a86ebfde1a2f24622d46f4bcc4b39

COPY krakend.template.json /etc/krakend/krakend.template.json
COPY entrypoint.sh /usr/local/bin/railway-krakend-entrypoint
RUN chmod +x /usr/local/bin/railway-krakend-entrypoint \
    && sed 's|__BACKEND_URL__|http://echo:8081|g' /etc/krakend/krakend.template.json > /tmp/krakend-build.json \
    && krakend check -c /tmp/krakend-build.json

ENV USAGE_DISABLE=1
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/railway-krakend-entrypoint"]
