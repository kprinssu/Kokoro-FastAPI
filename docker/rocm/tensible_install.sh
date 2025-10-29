#!/bin/bash

set -e

echo "Downloading AUR based Tensible library"
cd /tmp && wget https://archlinux.org/packages/extra/x86_64/rocblas/download -O rocblas.tar.zst
echo "Done downloading, the script will proceed to install the library files"

# Download and extract the library
tar --zstd --no-overwrite-dir -xvf rocblas.tar.zst && rm rocblas.tar.zst
rm -rf /app/.venv/lib/python3.12/site-packages/torch/lib/rocblas/library/
mv ./opt/rocm/lib/rocblas/library/ /app/.venv/lib/python3.12/site-packages/torch/lib/rocblas/
rm -rf /tmp/opt /tmp/usr
echo "Done.
