#!/bin/bash

# Install Jupyter notebook and dependencies on Termux
pkg update -y
pkg upgrade -y

apt install -y git clang
apt install -y python
apt install -y libzmq
apt install -y rust
pkg install -y binutils
pip install maturin
apt install -y cmake
pip install pyzmq

_file="$(find $PREFIX/lib/python3.12 -name "_sysconfigdata*.py")"
rm -rf $PREFIX/lib/python3.12/__pycache__
cp "$_file" "$_file".backup
sed -i 's|-fno-openmp-implicit-rpath||g' "$_file"

pip install jupyter
pkg install -y patchelf
patchelf --add-needed libpython3.12.so /data/data/com.termux/files/usr/lib/python3.12/site-packages/zmq/backend/cython/_zmq.cpython-312.so
pkg install -y matplotlib
