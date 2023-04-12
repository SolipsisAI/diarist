ifneq (,$(wildcard ./.env))
  include .env
  export
endif

.PHONY: timestamp install simulator run-ios run build build-ios devices generate clean

#FLUTTER_CMD=.fvm/flutter_sdk/bin/flutter  # There is an issue with fvm currently
FLUTTER_CMD=flutter
OPT_CMD=

ROOT_DIR=$(shell pwd)
APP_DIR=$(ROOT_DIR)/AppDir
TMP_DIR=$(ROOT_DIR)/tmp
TIMESTAMP=`date +'%Y-%m-%d_%T'`
ARCHIVE_DIR=$(TMP_DIR)/$(TIMESTAMP)
OS_NAME := $(shell uname -s | tr A-Z a-z)

ifeq ($(OS_NAME),darwin)
  target=macos
else
  target=linux
  OPT_CMD=bash ./build-linux.sh
endif

timestamp:
	echo $(TIMESTAMP)

install:
	@bash ./install_libs.sh
	@bash ./download_assets.sh
	@$(FLUTTER_CMD) pub get

simulator:
	@open -a Simulator.app

run-ios: simulator pub
	@$(FLUTTER_CMD) run -d $(IOS_DEVICE) -v

run: pub
	@$(FLUTTER_CMD) run -d $(target) -v

pub:
	@$(FLUTTER_CMD) pub get

build: pub
	@$(FLUTTER_CMD) build $(target) -v
	@$(OPT_CMD)

build-ios: pub
	@$(FLUTTER_CMD) build ipa

devices:
	@$(FLUTTER_CMD) devices

generate:
	@$(FLUTTER_CMD) pub run build_runner build --delete-conflicting-outputs

clean:
	@$(FLUTTER_CMD) clean
