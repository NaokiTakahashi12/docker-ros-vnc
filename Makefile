DOCKERFILENAME	:= Dockerfile
PROJECT     	:= ros-vnc
ORIGIN     		:= $(shell git remote get-url origin | sed -e 's/^.*@//g')
REVISION    	:= $(shell git rev-parse --short HEAD)
DOCKERFILES 	:= $(sort $(wildcard */$(DOCKERFILENAME)))

.PHONY: build
build:
	@for DOCKERFILE in $(DOCKERFILES); do \
        echo "start $(PROJECT):$$(echo $$DOCKERFILE | sed 's%/$(DOCKERFILENAME)%%') <<< $$DOCKERFILE"; \
		sleep 1; \
        docker build \
			--build-arg GIT_REVISION=$(REVISION) \
			--build-arg GIT_ORIGIN=$(REVISION) \
            --tag $(PROJECT):$$(echo $$DOCKERFILE | sed 's%/$(DOCKERFILENAME)%%') \
            --file $$DOCKERFILE \
            . >> /dev/null && \
		echo "finished $(PROJECT):$$(echo $$DOCKERFILE | sed 's%/$(DOCKERFILENAME)%%') <<< $$DOCKERFILE"; \
    done

.PHONY: clean
clean:
	@for DOCKERFILE in $(DOCKERFILES); do \
        echo "remove $(PROJECT):$$(echo $$DOCKERFILE | sed 's%/$(DOCKERFILENAME)%%')"; \
        docker image rm \
            $(PROJECT):$$(echo $$DOCKERFILE | sed 's%/$(DOCKERFILENAME)%%'); \
    done
	@echo "finish"
