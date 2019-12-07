#!/bin/sh
INSTALLERURL="https://github.com/STJr/SRB2/releases/download/SRB2_release_2.1.25/SRB2-v2125-Installer.exe"
PATCHURL="https://github.com/STJr/SRB2/releases/download/SRB2_release_2.1.25/SRB2-v2125-Patch.zip"
DOWNLOADCMD="curl -Lo"

cd assets
rm *.srb *.pk3 *.dta *.wad
${DOWNLOADCMD} srb2installer.exe ${INSTALLERURL}
7z e -y -aoa srb2installer.exe "*.srb" "*.pk3" "*.dta" "*.wad"
rm srb2installer.exe
cd patch
rm *.srb *.pk3 *.dta *.wad
${DOWNLOADCMD} srb2patch.zip ${PATCHURL}
unzip -o -j srb2patch.zip "*.srb" "*.pk3" "*.dta" "*.wad"
rm srb2patch.zip
cd ../..
make -C src/ SWITCH=1 clean
make -C src/ SWITCH=1