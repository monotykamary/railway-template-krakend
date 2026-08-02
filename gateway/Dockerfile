FROM docker.io/library/krakend:2.13.8@sha256:e8a4470820405ea728ffd1fd79ce4e6320966fa8c0b7a6e23e3ec822e8b4f62f

COPY krakend.template.json /etc/krakend/krakend.template.json
COPY entrypoint.sh /usr/local/bin/railway-krakend-entrypoint
RUN chmod +x /usr/local/bin/railway-krakend-entrypoint \
    && sed 's|__BACKEND_URL__|http://echo:8081|g' /etc/krakend/krakend.template.json > /tmp/krakend-build.json \
    && krakend check -c /tmp/krakend-build.json

ENV USAGE_DISABLE=1
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/railway-krakend-entrypoint"]
