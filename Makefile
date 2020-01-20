.PHONY: default boot run all clean

default:

boot:
	make -C boot/

kernel:
	make -C kernel/

run:
	qemu-system-x86_64 \
	-drive if=pflash,format=raw,readonly,file=tool/OVMF_CODE.fd \
	-drive if=pflash,format=raw,file=tool/OVMF_VARS.fd \
	fat:rw:fs/ -m 4G

all:
	make boot
	make kernel
	make run

clean:
	make -C boot/ clean
	make -C kernel/ clean

