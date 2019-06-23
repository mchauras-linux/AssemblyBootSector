rm -rf *.bin

nasm -f bin main.asm -o TindaOS.bin

qemu-system-x86_64 TindaOS.bin
