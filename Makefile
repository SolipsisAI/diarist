.PHONY: clean macos ios simulator devices install_deps

ROOT_DIR=$(shell pwd)
APP_DIR=$(ROOT_DIR)/AppDir
TMP_DIR=$(ROOT_DIR)/tmp
TIMESTAMP=$(shell date --iso=seconds)
ARCHIVE_DIR=$(TMP_DIR)/$(TIMESTAMP)

install:
	@bash ./install_libs.sh
	@bash ./download_assets.sh
	@fvm flutter pub get

simulator:
	@open -a Simulator.app

run-ios: simulator
	@fvm flutter run -d 'iphone 11'

run-macos:
	@fvm flutter run -d macos -v

run-linux:
	@fvm flutter run -d linux -v

devices:
	@fvm flutter devices

generate:
	@fvm flutter pub run build_runner build

build-linux:
	@fvm flutter build linux -v
	@appimage-builder --recipe AppImageBuilder.yml

clean:
	@fvm flutter clean
