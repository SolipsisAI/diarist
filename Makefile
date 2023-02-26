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

ios: simulator
	@fvm flutter run -d 'iphone 11'

macos:
	@fvm flutter run -d macos -v

linux:
	@fvm flutter run -d linux -v

devices:
	@fvm flutter devices

generate:
	@fvm flutter pub run build_runner build

build-linux: linux-archive
	@fvm flutter build linux -v
	@cp -r build/linux/x64/release/bundle $(APP_DIR)
	@appimage-builder --recipe AppImageBuilder.yml

linux-archive:
	@mkdir -p $(ARCHIVE_DIR)
	if test -f *.AppImage*; then mv *.AppImage* $(ARCHIVE_DIR); fi
	if test -d $(APP_DIR); then mv $(APP_DIR) $(ARCHIVE_DIR); fi

clean:
	@fvm flutter clean
