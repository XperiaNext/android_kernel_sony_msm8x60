#!/bin/bash
cp arch/arm/boot/zImage kernelelf/0
cd kernelelf/initramdisk
find . | cpio -o -H newc | gzip > ../1
cd ..
python mkelf.py -o kernel.elf 0@0x40208000 1@0x41500000,ramdisk 2@0x20000,rpm
fastboot flash boot kernel.elf
fastboot reboot
rm 0
rm 1
rm kernel.elf


# SEMC
#SUBSYSTEM=="usb", ATTR{idVendor}=="0fce", ATTR{idProduct}=="0dde", MODE="0666", OWNER="bpaul"  






