rm -rf boot_sec_mem.bin
nasm -f bin boot_sec_mem.asm -o boot_sec_mem.bin

qemu-system-x86_64 boot_sec_mem.bin
