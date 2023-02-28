.PHONY: clean ios run simulator devices install os build-linux

FLUTTER_CMD=.fvm/flutter_sdk/bin/flutter
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
endif

os:
	@echo $(OS_NAME)

install:
	@bash ./install_libs.sh
	@bash ./download_assets.sh
	@$(FLUTTER_CMD) pub get

simulator:
	@open -a Simulator.app

run-ios: simulator
	@$(FLUTTER_CMD) run -d 'iphone 11'

run:
	@$(FLUTTER_CMD) run -d $(target) -v

devices:
	@$(FLUTTER_CMD) devices

generate:
	@$(FLUTTER_CMD) pub run build_runner build

build-linux:
	@$(FLUTTER_CMD) build linux --release -v
	@appimage-builder --recipe AppImageBuilder.yml

build-macos:
	@$(FLUTTER_CMD) build macos

clean:
	@fvm flutter clean
