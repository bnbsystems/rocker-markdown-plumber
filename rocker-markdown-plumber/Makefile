TAG ?= latest
DOCKER_IMAGE ?= bnbsystems/rocker-markdown-plumber

.PHONY: all build test push 

build:
	docker build --network=host --no-cache -t $(DOCKER_IMAGE):dockerfile . 2>&1 | tee "${DOCKER_IMAGE}_$(date +%Y%m%d%H%M%S).log"

test:
	pytest -v --junitxml="result.xml"

lint: 
	hadolint 'Dockerfile'

push:
	docker tag $(DOCKER_IMAGE):dockerfile $(DOCKER_IMAGE):$(TAG)
	docker push $(DOCKER_IMAGE):$(TAG)

all:
	$(build)
	$(test)
	$(lint)
	$(push)