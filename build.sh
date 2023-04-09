#!/usr/bin/env bash
timestamp=$(date +"%Y")

mkdir -p tmp
mv Diarist.AppDir "tmp/$timestamp.AppDir"
mv Diarist-*.AppImage "tmp/$timestamp.AppImage"

cp -r build/linux/x64/release/bundle Diarist.AppDir
cp AppRun Diarist.AppDir/
cp Diarist.desktop Diarist.AppDir/
cp diarist.png Diarist.AppDir/

appimagetool Diarist.AppDir/
