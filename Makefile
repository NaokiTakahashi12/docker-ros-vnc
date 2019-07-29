DOCKERFILENAME := Dockerfile
PROJECT     := ros-vnc
REVISION    := $(shell git rev-parse --short HEAD)
TAG         := $(REVISION)
DOCKERFILES := $(wildcard */$(DOCKERFILENAME))

.PHONY: build
build:
    @for DOCKERFILE in $(DOCKERFILES); do \
        echo "$$(echo $$DOCKERFILE | sed 's/$(DOCKERFILENAME)/$(PROJECT)/') <<< $$DOCKERFILE"; \
        docker build \
            --tag $$(echo $$DOCKERFILE | sed 's/$(DOCKERFILENAME)/$(PROJECT)/'):$(TAG) \
            --file $$DOCKERFILE \
            . >> /dev/null; \
    done
	@echo "finish"

.PHONY: clean
clean:
    @for DOCKERFILE in $(DOCKERFILES); do \
        echo "remove $$(echo $$DOCKERFILE | sed 's/$(DOCKERFILENAME)/$(PROJECT)/'):$(TAG)"; \
        docker image rm \
            $$(echo $$DOCKERFILE | sed 's/$(DOCKERFILENAME)/$(PROJECT)/'):$(TAG); \
    done
	@echo "finish"
