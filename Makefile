.PHONY: install simulator run-ios run build build-ios devices generate clean

FLUTTER_CMD=.fvm/flutter_sdk/bin/flutter
OPT_CMD=

ROOT_DIR=$(shell pwd)
APP_DIR=$(ROOT_DIR)/AppDir
TMP_DIR=$(ROOT_DIR)/tmp
TIMESTAMP=$(shell date --iso=seconds)
ARCHIVE_DIR=$(TMP_DIR)/$(TIMESTAMP)
OS_NAME := $(shell uname -s | tr A-Z a-z)

ifeq ($(OS_NAME),darwin)
  target=macos
else
  target=linux
  OPT_CMD=appimage-builder --recipe AppImageBuilder.yml
endif

install:
	@bash ./install_libs.sh
	@bash ./download_assets.sh
	@$(FLUTTER_CMD) pub get

simulator:
	@open -a Simulator.app

run-ios: simulator
	@$(FLUTTER_CMD) run -d 'iphone 11' -v

run:
	@$(FLUTTER_CMD) run -d $(target) -v

build: 
	@$(FLUTTER_CMD) build $(target) -v
	@$(OPT_CMD)

build-ios:
	@$(FLUTTER_CMD) build ipa

devices:
	@$(FLUTTER_CMD) devices

generate:
	@$(FLUTTER_CMD) pub run build_runner build

clean:
	@$(FLUTTER_CMD) clean
