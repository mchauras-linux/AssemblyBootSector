nasm -f bin bootSec.asm -o bootSec.bin
qemu-system-x86_64 bootSec.bin
