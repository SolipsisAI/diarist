.PHONY: clean ios run simulator devices install os build-linux

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
	@fvm flutter pub get

simulator:
	@open -a Simulator.app

run-ios: simulator
	@fvm flutter run -d 'iphone 11'

run:
	@fvm flutter run -d $(target) -v

devices:
	@fvm flutter devices

generate:
	@fvm flutter pub run build_runner build

build-linux:
	@fvm flutter build linux --release -v
	@appimage-builder --recipe AppImageBuilder.yml

clean:
	@fvm flutter clean
