DOCKERFILE	:= Dockerfile
PROJECT     	:= ros-vnc
ORIGIN     		:= $(shell git remote get-url origin | sed -e 's/^.*@//g')
REVISION    	:= $(shell git rev-parse --short HEAD)
DOCKERFILES 	:= $(sort $(wildcard */$(DOCKERFILE)))
USERNAME		:= naokitakahashi12

KINETICBASE			:= kinetic-base
KINETICDESKTOP		:= kinetic-desktop
KINETICDESKTOPFULL	:= kinetic-desktop-full
MELODICBASE			:= melodic-base
MELODICDESKTOP		:= melodic-desktop
MELODICDESKTOPFULL	:= melodic-desktop-full
CRYSTALBASE			:= crystal-base
CRYSTALDESKTOP		:= crystal-desktop
DASHINGBASE			:= dashing-base
DASHINGDESKTOP		:= dashing-desktop

.PHONY: build
build: kineticdesktopfull melodicdesktopfull crystaldesktop dashingdesktop

kineticbase: $(KINETICBASE)/$(DOCKERFILE)
	@echo "build start $(USERNAME)/$(PROJECT):$(KINETICBASE) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(USERNAME)/$(PROJECT):$(KINETICBASE) \
	. >> /dev/null && \
	echo "build finished $(USERNAME)/$(PROJECT):$(KINETICBASE) <<< $<"

kineticdesktop: $(KINETICDESKTOP)/$(DOCKERFILE) kineticbase
	@echo "build start $(USERNAME)/$(PROJECT):$(KINETICDESKTOP) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(USERNAME)/$(PROJECT):$(KINETICDESKTOP) \
	. >> /dev/null && \
	echo "build finished $(USERNAME)/$(PROJECT):$(KINETICDESKTOP) <<< $<"

kineticdesktopfull: $(KINETICDESKTOPFULL)/$(DOCKERFILE) kineticdesktop
	@echo "build start $(USERNAME)/$(PROJECT):$(KINETICDESKTOPFULL) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(USERNAME)/$(PROJECT):$(KINETICDESKTOPFULL) \
	. >> /dev/null && \
	echo "build finished $(USERNAME)/$(PROJECT):$(KINETICDESKTOPFULL) <<< $<"

melodicbase: $(MELODICBASE)/$(DOCKERFILE)
	@echo "build start $(USERNAME)/$(PROJECT):$(MELODICBASE) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(USERNAME)/$(PROJECT):$(MELODICBASE) \
	. >> /dev/null && \
	echo "build finished $(USERNAME)/$(PROJECT):$(MELODICBASE) <<< $<"

melodicdesktop: $(MELODICDESKTOP)/$(DOCKERFILE) melodicbase
	@echo "build start $(USERNAME)/$(PROJECT):$(MELODICDESKTOP) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(USERNAME)/$(PROJECT):$(MELODICDESKTOP) \
	. >> /dev/null && \
	echo "build finished $(USERNAME)/$(PROJECT):$(MELODICDESKTOP) <<< $<"

melodicdesktopfull: $(MELODICDESKTOPFULL)/$(DOCKERFILE) melodicdesktop
	@echo "build start $(USERNAME)/$(PROJECT):$(MELODICDESKTOPFULL) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(USERNAME)/$(PROJECT):$(MELODICDESKTOPFULL) \
	. >> /dev/null && \
	echo "build finished $(USERNAME)/$(PROJECT):$(MELODICDESKTOPFULL) <<< $<"

crystalbase: $(CRYSTALBASE)/$(DOCKERFILE)
	@echo "build start $(USERNAME)/$(PROJECT):$(CRYSTALBASE) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(USERNAME)/$(PROJECT):$(CRYSTALBASE) \
	. >> /dev/null && \
	echo "build finished $(USERNAME)/$(PROJECT):$(CRYSTALBASE) <<< $<"

crystaldesktop: $(CRYSTALDESKTOP)/$(DOCKERFILE) crystalbase
	@echo "build start $(USERNAME)/$(PROJECT):$(CRYSTALDESKTOP) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(USERNAME)/$(PROJECT):$(CRYSTALDESKTOP) \
	. >> /dev/null && \
	echo "build finished $(USERNAME)/$(PROJECT):$(CRYSTALDESKTOP) <<< $<"

dashingbase: $(DASHINGBASE)/$(DOCKERFILE)
	@echo "build start $(USERNAME)/$(PROJECT):$(DASHINGBASE) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(USERNAME)/$(PROJECT):$(DASHINGBASE) \
	. >> /dev/null && \
	echo "build finished $(USERNAME)/$(PROJECT):$(DASHINGBASE) <<< $<"

dashingdesktop: $(DASHINGDESKTOP)/$(DOCKERFILE) dashingbase
	@echo "build start $(USERNAME)/$(PROJECT):$(DASHINGDESKTOP) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(USERNAME)/$(PROJECT):$(DASHINGDESKTOP) \
	. >> /dev/null && \
	echo "build finished $(USERNAME)/$(PROJECT):$(DASHINGDESKTOP) <<< $<"

.PHONY: clean
clean: $(KINETICBASE) $(KINETICDESKTOP) $(KINETICDESKTOPFULL) $(MELODICBASE) $(MELODICDESKTOP) $(MELODICDESKTOPFULL) $(CRYSTALBASE) $(CRYSTALDESKTOP) $(DASHINGBASE) $(DASHINGDESKTOP)
	@for IMAGETAG in $^; do \
		echo "remove $(PROJECT):$$IMAGETAG"; \
		docker image rm $(USERNAME)/$(PROJECT):$$IMAGETAG; \
	done
	@echo "finished"

