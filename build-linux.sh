#!/usr/bin/env bash
PACKAGE_ASSETS=package-assets/linux

timestamp=$(date +"%Y")

mkdir -p tmp
mv Diarist.AppDir "tmp/$timestamp.AppDir"
mv Diarist-*.AppImage "tmp/$timestamp.AppImage"

cp -r build/linux/x64/release/bundle Diarist.AppDir
cp "$PACKAGE_ASSETS/AppRun" Diarist.AppDir/
cp "$PACKAGE_ASSETS/Diarist.desktop" Diarist.AppDir/
cp "$PACKAGE_ASSETS/diarist.png" Diarist.AppDir/

appimagetool Diarist.AppDir/
