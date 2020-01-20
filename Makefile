.PHONY: default boot run all clean

default:

boot:
	cp boot/* edk2/MinLoaderPkg/Application/MinLoader/
	make -C edk2/
	cp edk2/

run:
	qemu-system-x86_64 \
	-drive if=pflash,format=raw,readonly,file=tool/OVMF_CODE.fd \
	-drive if=pflash,format=raw,file=tool/OVMF_VARS.fd \
	fat:rw:fs/ -m 4G

all:
	make boot
	make -C kernel/

clean:
	make -C kernel/ clean

