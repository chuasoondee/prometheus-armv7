
VER = 2.2.1

build:
ifeq (,$(wildcard ./prometheus-$(VER).linux-armv7.tar.gz))
	curl -LO https://github.com/prometheus/prometheus/releases/download/v$(VER)/prometheus-$(VER).linux-armv7.tar.gz
endif
	@[ -d ./prometheus ] || mkdir prometheus && tar zxvf prometheus-$(VER).linux-armv7.tar.gz -C ./prometheus --strip 1
	docker build -t prometheus-armv7 .

