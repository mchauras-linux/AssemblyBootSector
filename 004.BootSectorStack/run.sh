rm -rf *.bin

nasm -f bin *.asm -o TindaOS.bin

qemu-system-x86_64 TindaOS.bin
