ifeq ($(AQUA_ROOT_DIR),)
ifeq ($(XDG_DATA_HOME),)
	AQUA_ROOT_DIR := $(HOME)/.local/share/aquaproj-aqua
else
	AQUA_ROOT_DIR := $(XDG_DATA_HOME)/aquaproj-aqua
endif
endif

PATH := $(AQUA_ROOT_DIR)/bin:$(PATH)

.PHONY: setup-aqua
setup-aqua:
	bash scripts/setup_aqua.sh

.PHONY: tf-init
tf-init: setup-aqua
	terraform init
