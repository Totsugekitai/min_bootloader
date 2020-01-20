TARGET		= kernel.elf
CFLAGS		= -g -O0 \
			  -Wall -Wextra -Wno-unused-parameter \
			  -I /usr/include \
			  -nostdinc -nostdlib \
			  -fPIE \
			  -fno-builtin -fno-common -fno-stack-protector \
			  -mno-red-zone -mno-avx -mgeneral-regs-only
LDFLAGS		= -Map kernel.map -s -x -T link.ld

OBJS		= kernel.o

.PHONY: clean

$(TARGET): $(OBJS)
	ld $(LDFLAGS) -o $@ $+

%.o: %.c
	gcc $(CFLAGS) -c -o $@ $<

clean:
	rm -f *.o *.elf *.map
