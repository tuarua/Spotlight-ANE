#!/bin/sh

AneVersion="1.0.0"
FreSwiftVersion="3.1.0"

rm -r ios_dependencies/device
rm -r ios_dependencies/simulator

wget https://github.com/tuarua/Swift-IOS-ANE/releases/download/$FreSwiftVersion/ios_dependencies.zip
unzip -u -o ios_dependencies.zip
rm ios_dependencies.zip

wget https://github.com/tuarua/Swift-IOS-ANE/releases/download/$FreSwiftVersion/AIRSDK_patch.zip
unzip -u -o AIRSDK_patch.zip
rm AIRSDK_patch.zip

wget https://github.com/tuarua/Spotlight-ANE/releases/download/$AneVersion/ios_dependencies.zip
unzip -u -o ios_dependencies.zip
rm ios_dependencies.zip

wget -O ../native_extension/ane/SpotlightANE.ane https://github.com/tuarua/Spotlight-ANE/releases/download/$AneVersion/SpotlightANE.ane?raw=true