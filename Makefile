DOCKERFILE	:= Dockerfile
PROJECT     	:= ros-vnc
ORIGIN     		:= $(shell git remote get-url origin | sed -e 's/^.*@//g')
REVISION    	:= $(shell git rev-parse --short HEAD)
DOCKERFILES 	:= $(sort $(wildcard */$(DOCKERFILE)))

KINETICBASE			:= kinetic-base
KINETICDESKTOP		:= kinetic-desktop
KINETICDESKTOPFULL	:= kinetic-desktop-full
MELODICBASE			:= melodic-base
MELODICDESKTOP		:= melodic-desktop
MELODICDESKTOPFULL	:= melodic-desktop-full

.PHONY: build
build: kineticdesktopfull melodicdesktopfull

kineticbase: $(KINETICBASE)/$(DOCKERFILE)
	@echo "build start $(PROJECT):$(KINETICBASE) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(PROJECT):$(KINETICBASE) \
	. >> /dev/null && \
	echo "build finished $(PROJECT):$(KINETICBASE) <<< $<"

kineticdesktop: $(KINETICDESKTOP)/$(DOCKERFILE) kineticbase
	@echo "build start $(PROJECT):$(KINETICDESKTOP) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(PROJECT):$(KINETICDESKTOP) \
	. >> /dev/null && \
	echo "build finished $(PROJECT):$(KINETICDESKTOP) <<< $<"

kineticdesktopfull: $(KINETICDESKTOPFULL)/$(DOCKERFILE) kineticdesktop
	@echo "build start $(PROJECT):$(KINETICDESKTOPFULL) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(PROJECT):$(KINETICDESKTOPFULL) \
	. >> /dev/null && \
	echo "build finished $(PROJECT):$(KINETICDESKTOPFULL) <<< $<"

melodicbase: $(MELODICBASE)/$(DOCKERFILE)
	@echo "build start $(PROJECT):$(MELODICBASE) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(PROJECT):$(MELODICBASE) \
	. >> /dev/null && \
	echo "build finished $(PROJECT):$(MELODICBASE) <<< $<"

melodicdesktop: $(MELODICDESKTOP)/$(DOCKERFILE) melodicbase
	@echo "build start $(PROJECT):$(MELODICDESKTOP) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(PROJECT):$(MELODICDESKTOP) \
	. >> /dev/null && \
	echo "build finished $(PROJECT):$(MELODICDESKTOP) <<< $<"

melodicdesktopfull: $(MELODICDESKTOPFULL)/$(DOCKERFILE) melodicdesktop
	@echo "build start $(PROJECT):$(MELODICDESKTOPFULL) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(PROJECT):$(MELODICDESKTOPFULL) \
	. >> /dev/null && \
	echo "build finished $(PROJECT):$(MELODICDESKTOPFULL) <<< $<"

.PHONY: clean
clean: $(KINETICBASE) $(KINETICDESKTOP) $(KINETICDESKTOPFULL) $(MELODICBASE) $(MELODICDESKTOP) $(MELODICDESKTOPFULL)
	@for IMAGETAG in $^; do \
		echo "remove $(PROJECT):$$IMAGETAG"; \
		docker image rm $(PROJECT):$$IMAGETAG; \
	done
	@echo "finished"

