CDLIC_FILE = /usr/local/psxsdk/share/licenses/infousa.dat

.PHONY: all exe cd audio tim compress_textures bin2c clean

# Default: build both
all: exe cd

# ===== STANDALONE EXE =====
exe: audio tim compress_textures bin2c
	mkdir -p binary standalone
	psx-gcc -Wall -O3 -DSTANDALONE -o 240p.elf 240p.c patterns.c tests.c font.c lz4.c textures.c help.c sg_string.c
	elf2exe 240p.elf 240p.exe
	mv 240p.exe standalone/240p_standalone.exe
	rm -f 240p.elf

# ===== CD IMAGES (original behavior) =====
cd: audio tim compress_textures bin2c
	mkdir -p binary
	psx-gcc -Wall -O3 -o 240p.elf 240p.c patterns.c tests.c font.c lz4.c textures.c help.c sg_string.c
	elf2exe 240p.elf 240p.exe
	cp 240p.exe binary
	systemcnf 240p.exe > binary/system.cnf
	mkisofs -o ./binary/240p.hsf -V 240pTestSuite -sysid PLAYSTATION binary
	cd ./binary && mkpsxiso 240p.hsf 240pTestSuitePS1-EMU.bin $(CDLIC_FILE);
	rm -f ./binary/240p.hsf
	
	psx-gcc -Wall -O3 -DREAL_HW -o 240p.elf 240p.c patterns.c tests.c font.c lz4.c textures.c help.c sg_string.c
	elf2exe 240p.elf 240p.exe
	cp 240p.exe binary
	systemcnf 240p.exe > binary/system.cnf
	mkisofs -o ./binary/240p.hsf -V 240pTestSuite -sysid PLAYSTATION binary
	cd ./binary && mkpsxiso 240p.hsf 240pTestSuitePS1.bin $(CDLIC_FILE);
	rm -f ./binary/240p.hsf ./binary/240p.exe ./binary/system.cnf
	rm -f 240p.elf 240p.exe

# ===== KEEP ALL EXISTING RULES BELOW =====
# audio: ...
# tim: ...
# compress_textures: ...
# bin2c: ...
# clean: ...
