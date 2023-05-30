.SILENT: inspect-hash

build:
	docker build -t talk-docker-layers:base-layer -f BaseLayer.Dockerfile .
	docker build -t talk-docker-layers:layer1 -f Layer1.Dockerfile .
	docker build -t talk-docker-layers:layer2 -f Layer2.Dockerfile .

name?=talk-docker-layers
layer?=layer2
run:
	docker run --name $(name) --entrypoint sh -w /var/layers --rm -ti talk-docker-layers:$(layer)

inspect-host-fs:
	docker run --rm -ti --name hostos --privileged -v /:/host-root -w /host-root alpine

inspect:
	docker image inspect talk-docker-layers:$(layer)

inspect-container:
	docker container inspect $(name)

hash?=
inspect-hash:
	[ -n "$(hash)" ] || { echo "Missing hash=... argument"; exit 1; }
	docker image inspect $(hash)
