#! /bin/bash
IMAGE=tindaOS.img 
./clean.sh
./compileAsnFile.sh
./displayBinaryFileContent.sh $IMAGE
./exeQemu.sh
