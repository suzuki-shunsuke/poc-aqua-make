ifeq ($(AQUA_ROOT_DIR),)
ifeq ($(XDG_DATA_HOME),)
	AQUA_ROOT_DIR := $(HOME)/.local/share/aquaproj-aqua
else
	AQUA_ROOT_DIR := $(XDG_DATA_HOME)/aquaproj-aqua
endif
endif

PATH := $(AQUA_ROOT_DIR)/bin:$(PATH)

AQUA_VERSION := "v2.6.0"

.PHONY: install-aqua
install-aqua: .aqua/aqua-$(AQUA_VERSION)

.aqua/aqua-$(AQUA_VERSION):
	AQUA_VERSION=$(AQUA_VERSION) bash scripts/setup_aqua.sh

.PHONY: aqua-install
aqua-install: install-aqua
	aqua i -l

.PHONY: lint
lint: aqua-install
	golangci-lint run
