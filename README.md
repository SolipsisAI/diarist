# diarist

This is the Flutter app for Diarist.

- [diarist](#diarist)
- [Development](#development)
  - [Pre-requisites](#pre-requisites)
  - [Automated Setup](#automated-setup)
  - [Setup with pre-built libraries](#setup-with-pre-built-libraries)
    - [iOS](#ios)
    - [Linux](#linux)
    - [macOS](#macos)
  - [Python manual setup](#python-manual-setup)
  - [Running app](#running-app)
- [Building](#building)
  - [Linux](#linux-1)
- [Troubleshooting](#troubleshooting)
  - [`numpy` not found](#numpy-not-found)

# Screenshots
![ios](screenshots/ios-screenshot.png)

# Development

## Pre-requisites

- [`fvm`](https://fvm.app/docs/getting_started/installation) for managing multiple flutter versions, in this case 3.7.10
- `bazel-5.0.0` to be installed by `install_libs.sh`
- `python3` which can be set up by the `install_libs.sh` script.
- `numpy` same as above
- [`TensorFlowLiteC.framework`](https://solipsis-data.s3.us-east-2.amazonaws.com/pkg/TensorFlowLiteC.framework.zip)

## Automated Setup

```shell
# Clone the `flutter_chat_ui` fork I created and this repo to the same directory.
git clone git@github.com:SolipsisAI/flutter_chat_ui.git
git clone git@github.com:SolipsisAI/diarist.git

# Clone `tflite_flutter_plugin` which is a dep of the above
git clone git@github.com:SolipsisAI/tflite_flutter_plugin.git

# Get dependencies
cd diarist
flutter pub get
```

In the `tensorflow` repo, change `TFL_MINIMUM_OS_VERSION` to `"12.0"` in `lite/ios/ios.bzl`:

```
TFL_MINIMUM_OS_VERSION = "12.0"
```

Then run the scripts:
```shell
# INSTALL LIBRARIES FOR DESKTOP
bash ./install_libs.sh

# INSTALL LIBRARIES FOR IOS
INCLUDE_IOS=true bash ./install_libs.sh

# DOWNLOAD ASSETS
bash ./download_assets.sh
```

## Setup with pre-built libraries

### iOS

Download [TensorFlowLiteC.framework.zip](https://solipsis-data.s3.us-east-2.amazonaws.com/pkg/TensorFlowLiteC.framework.zip).

In terminal:
```shell
# Install dependencies
fvm flutter clean
fvm flutter pub get

# Download framework
curl -LO https://solipsis-data.s3.us-east-2.amazonaws.com/pkg/TensorFlowLiteC.framework.zip 
unzip TensorFlowLiteC.framework.zip -d ios/.symlinks/plugins/tflite_flutter/ios

# Setup with flutter
cd ios
pod install
fvm flutter clean
fvm flutter pub get
```

### Linux

NOTE: If your Linux version doesn't match what this pre-built `*.so` was built in, this will not work and you will need to compile from source.

Download [libtensorflowlite_c-linux.so](https://solipsis-data.s3.us-east-2.amazonaws.com/blobs/libtensorflowlite_c-linux.so) and place in `blobs/`:

```shell
mkdir -p blobs
cd blobs
curl -LO https://solipsis-data.s3.us-east-2.amazonaws.com/blobs/libtensorflowlite_c-linux.so
cd ..
```

### macOS

Download [libtensorflowlite_c-mac.dylib](https://solipsis-data.s3.us-east-2.amazonaws.com/blobs/libtensorflowlite_c-mac.dylib) and place in `blobs/`:

```shell
mkdir -p blobs
cd blobs
curl -LO https://solipsis-data.s3.us-east-2.amazonaws.com/blobs/libtensorflowlite_c-mac.dylib
cd ..
```

## Python manual setup

```shell
# SETUP PYTHON
pyenv install miniforge3

# Activate miniforge3
pyenv shell miniforge3

# Setup conda environment
conda create --name tensorflow # this can be any name

# Activate environment
conda activate tensorflow

# Install numpy
conda install numpy
```

## Running app

```shell
$ flutter devices # list devices that flutter can run on

2 connected devices:

macOS (desktop) • macos  • darwin-arm64   • macOS 12.0.1 21A559 darwin-arm
Chrome (web)    • chrome • web-javascript • Google Chrome 98.0.4758.102

$ open -a Simulator.app # launch iOS Simulator
$ flutter devices

3 connected devices:

iPhone 11 (mobile) • longstringhere • ios            • com.apple.CoreSimulator.SimRuntime.iOS-15-2 (simulator)
macOS (desktop)    • macos                                • darwin-arm64   • macOS 12.0.1 21A559 darwin-arm
Chrome (web)       • chrome                               • web-javascript • Google Chrome 98.0.4758.102

$ flutter run -d 'iphone 11' # launch app in Simulator

# Launch on Linux
$ flutter run -d linux --verbose
```

# Building

NOTE: On Linux, upon launch the build is so slow.

## Linux

Building an AppImage.

See https://bitjockey.space/Building-Flutter-apps-for-distribution#build-1.

```shell
flutter build linux -v  # passing --release for some reason excludes the assets
cp -r build/linux/x64/release/bundle $PWD/AppDir  # where $PWD is this root repo
appimage-builder --recipe AppImageBuilder.yml
```

# Troubleshooting

## `numpy` not found

If you are using `pyenv` and a `venv`, make sure `pyenv` is set up in your shell configuration. And use a different terminal window.
