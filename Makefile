IMAGE ?= jvassev/fdb
TAG   ?= 5.1.7-1

build-image:
	docker build -t $(IMAGE):$(TAG) .

push-image: build-image
	docker push $(IMAGE):$(TAG)

push-latest:
	docker tag $(IMAGE):$(TAG) $(IMAGE):latest
	docker push $(IMAGE):latest

run-server: build-image
	docker run --rm -ti --net=host $(IMAGE):$(TAG) .

shell:
	docker run --net=host --rm -ti --entrypoint=/bin/bash $(IMAGE):$(TAG)

cli:
	docker run --net=host --rm -ti --entrypoint=fdbcli $(IMAGE):$(TAG)
