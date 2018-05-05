# prometheus-armv7

Prometheus Docker image for Raspberry Pi based on [rpi-alpine-scratch](https://github.com/hypriot/rpi-alpine-scratch)

## Usage

### Create your own image

```
FROM chuasoondee/prometheus-armv7
COPY ./prometheus.yml /etc/prometheus/prometheus.yml
```

### Using image as is with supplied `prometheus.yml`

```
docker run -d --name prometheus -v $PWD/prometheus.yml:/etc/prometheus/prometheus.yml -p 9090:9090 chuasoondee/prometheus-armv7
```

### Build

```
git clone https://github.com/chuasoondee/prometheus-armv7.git && \
cd prometheus-armv7 && \
make
```

