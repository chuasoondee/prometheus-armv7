FROM hypriot/rpi-alpine-scratch
MAINTAINER "Chua Soon Dee" <soondee.chua@gmail.com>

RUN apk update && \
apk upgrade && \
apk add bash && \
rm -rf /var/cache/apk/*

RUN mkdir -p /etc/prometheus/conf.d
RUN mkdir -p /etc/prometheus/rules
RUN mkdir -p /etc/prometheus/file_sd

COPY prometheus/prometheus /usr/local/bin/
COPY prometheus/promtool /usr/local/bin/
COPY prometheus/prometheus.yml /usr/local/bin/prometheus.yml
COPY prometheus/consoles /etc/prometheus/consoles
COPY prometheus/console_libraries /etc/prometheus/console_libraries

EXPOSE 9090
VOLUME ["/prometheus"]
WORKDIR /prometheus
ENTRYPOINT ["/usr/local/bin/prometheus"]
CMD ["--config.file=/etc/prometheus/prometheus.yml", \
    "--storage.tsdb.path=/prometheus", \
    "--web.console.libraries=/etc/prometheus/console_libraries", \
    "--web.console.templates=/etc/prometheus/consoles"]

