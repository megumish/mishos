#!/bin/bash

# install prerequistion
suod apt -y update
sudo apt -y install build-essential uuid-dev iasl git gcc-5 nasm python3-distutils

# ----start edk2 setup----

# clone
mkdir ~/src
cd ~/src
git clone https://github.com/tianocore/edk2.git

# Compile build tools
cd ~/src/edk2
make -C BaseTools
. edksetup.sh

# Build the EDK II BaseTools
make -C edk2/BaseTools

# setup build shell environment
cd ~/src/edk2
export EDK_TOOLS_PATH=$HOME/src/edk2/BaseTools
. edksetup.sh BaseTools

# setup .bashrc
cd ~/src/edk2
echo ". edksetup.sh" > ~/.bashrc

# ----end edk2 setup----

# ----start clang9 setup----

# install prerequistion
sudo apt-get -y install software-properties-common

cd ~/src
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 9

# ----end clang9 setup----