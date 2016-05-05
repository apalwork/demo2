
ifdef SystemRoot
   RM = del /Q
   FixPath = $(subst /,\,$1)
else
   ifeq ($(shell uname), Linux)
      RM = rm -f
      FixPath = $1
   endif
endif

	CC= sdcc
	LD= sdld
	AS= sdas311
	H2B= hex2bin
	WAV= sweep.bin

all: lib212demo.bin


lib212demo.bin: demo212.bin spidata.bin
	cat  demo212.bin  zero64k.bi1 > zz.bin
	head -c 4096 zz.bin > zz.bi1
	cat zz.bi1  spidata.bin > lib212demo.bin
	$(RM) zz.bin 


demo212.bin: demo212.ihx
	$(H2B) demo212.ihx

demo212.ihx: demo212.rel 
	$(LD) -u -m -i -y demo212 demo212 -l ms311sdcc.lib -l ms311sph.lib

demo212.rel: demo212.asm 
	$(AS) -l -o -s -y demo212.asm

demo212.asm: demo212.c Makefile spidata.h
	$(CC) -pMS311 -OB -OF -OC demo212.c

clean:
	$(RM) lib212demo.bin
	$(RM) demo212.rel
	$(RM) demo212.asm
