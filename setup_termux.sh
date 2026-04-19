#!/bin/bash

# Install Jupyter notebook and dependencies on Termux
pkg update -y
pkg upgrade -y

pkg install git clang -y
pkg install -y python
pkg install -y libzmq
pkg install -y rust
pkg install -y binutils
pip install maturin
pkg install -y cmake
pip install pyzmq

_file="$(find $PREFIX/lib/python3.13 -name "_sysconfigdata*.py")"
rm -rf $PREFIX/lib/python3.13/__pycache__
cp "$_file" "$_file".backup
sed -i 's|-fno-openmp-implicit-rpath||g' "$_file"

pkg install -y python-psutil
pip install jupyter
