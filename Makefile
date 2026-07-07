CDLIC_FILE = /usr/local/psxsdk/share/licenses/infousa.dat

all: audio tim compress_textures bin2c
	mkdir binary
	psx-gcc  -Wall -O3 -o 240p.elf 240p.c patterns.c tests.c font.c lz4.c textures.c help.c sg_string.c
	elf2exe 240p.elf 240p.exe
	cp 240p.exe binary
	systemcnf 240p.exe > binary/system.cnf
	mkisofs -o ./binary/240p.hsf -V 240pTestSuite -sysid PLAYSTATION binary
	cd ./binary && mkpsxiso 240p.hsf 240pTestSuitePS1-EMU.bin $(CDLIC_FILE);
	rm -f ./binary/240p.hsf
	rm -f 240p.elf
	rm -f 240p.exe
	###################
	psx-gcc  -Wall -O3 -DREAL_HW -o 240p.elf 240p.c patterns.c tests.c font.c lz4.c textures.c help.c sg_string.c
	elf2exe 240p.elf 240p.exe
	cp 240p.exe binary
	systemcnf 240p.exe > binary/system.cnf
	mkisofs -o ./binary/240p.hsf -V 240pTestSuite -sysid PLAYSTATION binary
	cd ./binary && mkpsxiso 240p.hsf 240pTestSuitePS1.bin $(CDLIC_FILE);
	rm -f ./binary/240p.hsf
	rm -f ./binary/240p.exe
	rm -f ./binary/system.cnf
	rm -f ./240p.elf
	rm -f ./240p.exe

audio:
	./tools/wav2vag.exe ./resources/beep.wav ./resources/beep.raw -raw

tim:
	mkdir patterns
	./tools/bmp2tim.exe textures/grid224.bmp patterns/grid224.tim 4 -org=320,0 -noblack -clut=912,480
	./tools/bmp2tim.exe textures/grid240.bmp patterns/grid240.tim 4 -org=448,0 -noblack -clut=912,481
	./tools/bmp2tim.exe textures/grid256.bmp patterns/grid256.tim 4 -org=576,0 -noblack -clut=912,482
	./tools/bmp2tim.exe textures/gridw256224.bmp patterns/gridw256224.tim 4 -org=320,0 -noblack -clut=912,480
	./tools/bmp2tim.exe textures/gridw256240.bmp patterns/gridw256240.tim 4 -org=448,0 -noblack -clut=912,481
	./tools/bmp2tim.exe textures/gridw256256.bmp patterns/gridw256256.tim 4 -org=576,0 -noblack -clut=912,482
	./tools/bmp2tim.exe textures/SMPTE100.bmp patterns/SMPTE100.tim 4 -org=320,0 -clut=912,480
	./tools/bmp2tim.exe textures/SMPTE75.bmp patterns/SMPTE75.tim 4 -org=640,0   -clut=912,481
	./tools/bmp2tim.exe textures/EBU100.bmp patterns/EBU100.tim 4 -org=320,0 -clut=912,480
	./tools/bmp2tim.exe textures/EBU75.bmp patterns/EBU75.tim 4 -org=640,0 -clut=912,481
	./tools/bmp2tim.exe textures/colorgray.bmp patterns/colorgray.tim 4 -org=320,0 -clut=912,480
	./tools/bmp2tim.exe textures/colorbleed.bmp patterns/colorbleed.tim 4 -org=640,256 -clut=912,480
	./tools/bmp2tim.exe textures/colorbleedchk.bmp patterns/colorbleedchk.tim 4 -org=640,0 -clut=912,481
	./tools/bmp2tim.exe textures/color.bmp patterns/color.tim 8 -org=320,0 -clut=768,485
	./tools/bmp2tim.exe textures/colorgrid.bmp patterns/colorgrid.tim 8 -org=640,0 -clut=768,486
	./tools/bmp2tim.exe textures/colorgridw256.bmp patterns/colorgridw256.tim 8 -org=640,0 -clut=768,486
	./tools/bmp2tim.exe textures/pluge.bmp patterns/pluge.tim 4 -org=320,0 -clut=912,480
	./tools/bmp2tim.exe textures/linearity.bmp patterns/linearity.tim 4 -org=320,0 -noblack -clut=912,480
	./tools/bmp2tim.exe textures/linearity224.bmp patterns/linearity224.tim 4 -org=448,0 -noblack -clut=912,481
	./tools/bmp2tim.exe textures/linearity240pal.bmp patterns/linearity240pal.tim 4 -org=576,0 -noblack -clut=912,483
	./tools/bmp2tim.exe textures/linearityw256224.bmp patterns/linearityw256224.tim 4 -org=448,0 -noblack -clut=912,481
	./tools/bmp2tim.exe textures/linearityw256224pal.bmp patterns/linearityw256224pal.tim 4 -org=576,0 -noblack -clut=912,483
	./tools/bmp2tim.exe textures/linearitygriddot.bmp patterns/linearitygriddot.tim 4 -org=1000,256 -noblack -clut=912,482
	./tools/bmp2tim.exe textures/grayramp.bmp patterns/grayramp.tim 8 -org=320,0 -clut=768,480
	./tools/bmp2tim.exe textures/sharpness.bmp patterns/sharpness.tim 4 -org=320,0 -clut=912,480
	./tools/bmp2tim.exe textures/sharpness224.bmp patterns/sharpness224.tim 4 -org=448,0 -clut=912,481
	./tools/bmp2tim.exe textures/sharpnessw256224.bmp patterns/sharpnessw256224.tim 4 -org=448,0 -clut=912,481
	./tools/bmp2tim.exe textures/sharpnessw256240.bmp patterns/sharpnessw256240.tim 4 -org=320,0 -clut=912,480
	./tools/bmp2tim.exe textures/lingrid.bmp patterns/lingrid.tim 4 -org=704,0 -noblack -clut=912,487
	./tools/bmp2tim.exe textures/checkerboard.bmp patterns/checkerboard.tim 4 -org=896,256  -clut=912,480
	./tools/bmp2tim.exe textures/circle.bmp patterns/circle.tim 4 -org=320,0  -noblack -clut=912,480
	./tools/bmp2tim.exe textures/numbers.bmp patterns/numbers.tim 4 -org=640,0 -mpink -clut=912,484
	#############################
	./tools/bmp2tim.exe textures/sonicsky.bmp patterns/sonicsky.tim 4 -org=832,256  -clut=912,499
	./tools/bmp2tim.exe textures/sonicback1.bmp patterns/sonicback1.tim 4 -org=640,0  -clut=912,481
	./tools/bmp2tim.exe textures/sonicback2.bmp patterns/sonicback2.tim 4 -org=640,128  -clut=912,482
	./tools/bmp2tim.exe textures/sonicback3.bmp patterns/sonicback3.tim 4 -org=640,256  -clut=912,483
	./tools/bmp2tim.exe textures/sonicback4.bmp patterns/sonicback4.tim 4 -org=640,384  -clut=912,484
	#############################
	./tools/bmp2tim.exe textures/sonicfloor.bmp patterns/sonicfloor.tim 4 -org=768,256 -noblack -clut=912,485
	./tools/bmp2tim.exe textures/kiki.bmp patterns/kiki.tim 4 -org=704,0 -clut=912,486
	./tools/bmp2tim.exe textures/motoko.bmp patterns/motoko.tim 8 -org=768,0 -clut=768,480
	./tools/bmp2tim.exe textures/striped.bmp patterns/striped.tim 4 -org=1016,424 -mpink -clut=912,487
	./tools/bmp2tim.exe textures/buzzbomber.bmp patterns/buzzbomber.tim 4 -org=1004,384 -mpink -clut=912,490
	./tools/bmp2tim.exe textures/buzzbombershadow.bmp patterns/buzzbombershadow.tim 4 -org=1016,384 -mpink -clut=912,491
	./tools/bmp2tim.exe textures/shadow.bmp patterns/shadow.tim 4 -org=1004,424 -mpink -clut=912,492
	./tools/bmp2tim.exe textures/convergence.bmp patterns/convergence.tim 4 -org=320,0 -noblack -clut=912,490
	./tools/bmp2tim.exe textures/font.bmp patterns/font.tim 4 -mpink -org=960,256  -clut=960,321
	./tools/bmp2tim.exe textures/lagper.bmp patterns/lagper.tim 4 -mpink -org=992,424  -clut=912,490
	./tools/bmp2tim.exe textures/back.bmp patterns/back.tim 4 -org=944,0  -clut=960,510
	./tools/bmp2tim.exe textures/backw256.bmp patterns/backw256.tim 4 -org=960,0  -clut=960,510
	./tools/bmp2tim.exe textures/gillian.bmp patterns/gillian.tim 4 -org=1008,256 -mpink -clut=960,511

compress_textures:
	./tools/lz4compress.exe ./patterns/grid224.tim ./patterns/grid224.lz4
	./tools/lz4compress.exe ./patterns/grid240.tim ./patterns/grid240.lz4
	./tools/lz4compress.exe ./patterns/grid256.tim ./patterns/grid256.lz4
	./tools/lz4compress.exe ./patterns/gridw256224.tim ./patterns/gridw256224.lz4
	./tools/lz4compress.exe ./patterns/gridw256240.tim ./patterns/gridw256240.lz4
	./tools/lz4compress.exe ./patterns/gridw256256.tim ./patterns/gridw256256.lz4
	./tools/lz4compress.exe ./patterns/SMPTE100.tim ./patterns/SMPTE100.lz4
	./tools/lz4compress.exe ./patterns/SMPTE75.tim ./patterns/SMPTE75.lz4
	./tools/lz4compress.exe ./patterns/EBU100.tim ./patterns/EBU100.lz4
	./tools/lz4compress.exe ./patterns/EBU75.tim ./patterns/EBU75.lz4
	./tools/lz4compress.exe ./patterns/colorgray.tim ./patterns/colorgray.lz4
	./tools/lz4compress.exe ./patterns/colorbleed.tim ./patterns/colorbleed.lz4
	./tools/lz4compress.exe ./patterns/colorbleedchk.tim ./patterns/colorbleedchk.lz4
	./tools/lz4compress.exe ./patterns/color.tim ./patterns/color.lz4
	./tools/lz4compress.exe ./patterns/colorgrid.tim ./patterns/colorgrid.lz4
	./tools/lz4compress.exe ./patterns/colorgridw256.tim ./patterns/colorgridw256.lz4
	./tools/lz4compress.exe ./patterns/pluge.tim ./patterns/pluge.lz4
	./tools/lz4compress.exe ./patterns/linearity.tim ./patterns/linearity.lz4
	./tools/lz4compress.exe ./patterns/linearity224.tim ./patterns/linearity224.lz4
	./tools/lz4compress.exe ./patterns/linearity240pal.tim ./patterns/linearity240pal.lz4
	./tools/lz4compress.exe ./patterns/linearityw256224.tim ./patterns/linearityw256224.lz4
	./tools/lz4compress.exe ./patterns/linearityw256224pal.tim ./patterns/linearityw256224pal.lz4
	./tools/lz4compress.exe ./patterns/linearitygriddot.tim ./patterns/linearitygriddot.lz4
	./tools/lz4compress.exe ./patterns/grayramp.tim ./patterns/grayramp.lz4
	./tools/lz4compress.exe ./patterns/sharpness.tim ./patterns/sharpness.lz4
	./tools/lz4compress.exe ./patterns/sharpness224.tim ./patterns/sharpness224.lz4
	./tools/lz4compress.exe ./patterns/sharpnessw256240.tim ./patterns/sharpnessw256240.lz4
	./tools/lz4compress.exe ./patterns/sharpnessw256224.tim ./patterns/sharpnessw256224.lz4
	./tools/lz4compress.exe ./patterns/lingrid.tim ./patterns/lingrid.lz4
	./tools/lz4compress.exe ./patterns/checkerboard.tim ./patterns/checkerboard.lz4
	./tools/lz4compress.exe ./patterns/sonicsky.tim ./patterns/sonicsky.lz4
	./tools/lz4compress.exe ./patterns/sonicsky.tim ./patterns/sonicsky.lz4
	./tools/lz4compress.exe ./patterns/sonicback1.tim ./patterns/sonicback1.lz4
	./tools/lz4compress.exe ./patterns/sonicback2.tim ./patterns/sonicback2.lz4
	./tools/lz4compress.exe ./patterns/sonicback3.tim ./patterns/sonicback3.lz4
	./tools/lz4compress.exe ./patterns/sonicback4.tim ./patterns/sonicback4.lz4
	./tools/lz4compress.exe ./patterns/sonicfloor.tim ./patterns/sonicfloor.lz4
	./tools/lz4compress.exe ./patterns/kiki.tim ./patterns/kiki.lz4
	./tools/lz4compress.exe ./patterns/motoko.tim ./patterns/motoko.lz4
	./tools/lz4compress.exe ./patterns/striped.tim ./patterns/striped.lz4
	./tools/lz4compress.exe ./patterns/buzzbomber.tim ./patterns/buzzbomber.lz4
	./tools/lz4compress.exe ./patterns/buzzbombershadow.tim ./patterns/buzzbombershadow.lz4
	./tools/lz4compress.exe ./patterns/shadow.tim ./patterns/shadow.lz4
	./tools/lz4compress.exe ./patterns/font.tim ./patterns/font.lz4
	./tools/lz4compress.exe ./patterns/circle.tim ./patterns/circle.lz4
	./tools/lz4compress.exe ./patterns/numbers.tim ./patterns/numbers.lz4
	./tools/lz4compress.exe ./patterns/lagper.tim ./patterns/lagper.lz4
	./tools/lz4compress.exe ./patterns/back.tim ./patterns/back.lz4
	./tools/lz4compress.exe ./patterns/backw256.tim ./patterns/backw256.lz4
	./tools/lz4compress.exe ./patterns/gillian.tim ./patterns/gillian.lz4
	./tools/lz4compress.exe ./patterns/convergence.tim ./patterns/convergence.lz4

bin2c:
	./tools/bin2c.exe grid224 < patterns/grid224.lz4 > ./patterns/grid224.c
	./tools/bin2c.exe grid240 < patterns/grid240.lz4 > ./patterns/grid240.c
	./tools/bin2c.exe grid256 < patterns/grid256.lz4 > ./patterns/grid256.c
	./tools/bin2c.exe gridw256224 < patterns/gridw256224.lz4 > ./patterns/gridw256224.c
	./tools/bin2c.exe gridw256240 < patterns/gridw256240.lz4 > ./patterns/gridw256240.c
	./tools/bin2c.exe gridw256256 < patterns/gridw256256.lz4 > ./patterns/gridw256256.c
	./tools/bin2c.exe SMPTE100 < patterns/SMPTE100.lz4 > ./patterns/SMPTE100.c
	./tools/bin2c.exe SMPTE75 < patterns/SMPTE75.lz4 > ./patterns/SMPTE75.c
	./tools/bin2c.exe EBU100 < patterns/EBU100.lz4 > ./patterns/EBU100.c
	./tools/bin2c.exe EBU75 < patterns/EBU75.lz4 > ./patterns/EBU75.c
	./tools/bin2c.exe colorgray < patterns/colorgray.lz4 > ./patterns/colorgray.c
	./tools/bin2c.exe colorbleed < patterns/colorbleed.lz4 > ./patterns/colorbleed.c
	./tools/bin2c.exe colorbleedchk < patterns/colorbleedchk.lz4 > ./patterns/colorbleedchk.c
	./tools/bin2c.exe color < patterns/color.lz4 > ./patterns/color.c
	./tools/bin2c.exe colorgrid < patterns/colorgrid.lz4 > ./patterns/colorgrid.c
	./tools/bin2c.exe colorgridw256 < patterns/colorgridw256.lz4 > ./patterns/colorgridw256.c
	./tools/bin2c.exe pluge < patterns/pluge.lz4 > ./patterns/pluge.c
	./tools/bin2c.exe linearity < patterns/linearity.lz4 > ./patterns/linearity.c
	./tools/bin2c.exe linearity224 < patterns/linearity224.lz4 > ./patterns/linearity224.c
	./tools/bin2c.exe linearity240pal < patterns/linearity240pal.lz4 > ./patterns/linearity240pal.c
	./tools/bin2c.exe linearityw256224 < patterns/linearityw256224.lz4 > ./patterns/linearityw256224.c
	./tools/bin2c.exe linearityw256224pal < patterns/linearityw256224pal.lz4 > ./patterns/linearityw256224pal.c
	./tools/bin2c.exe linearitygriddot < patterns/linearitygriddot.lz4 > ./patterns/linearitygriddot.c
	./tools/bin2c.exe grayramp < patterns/grayramp.lz4 > ./patterns/grayramp.c
	./tools/bin2c.exe sharpness < patterns/sharpness.lz4 > ./patterns/sharpness.c
	./tools/bin2c.exe sharpness224 < patterns/sharpness224.lz4 > ./patterns/sharpness224.c
	./tools/bin2c.exe sharp256240 < patterns/sharpnessw256240.lz4 > ./patterns/sharpnessw256240.c
	./tools/bin2c.exe sharp256224 < patterns/sharpnessw256224.lz4 > ./patterns/sharpnessw256224.c
	./tools/bin2c.exe lingrid < patterns/lingrid.lz4 > ./patterns/lingrid.c
	./tools/bin2c.exe checkerboard < patterns/checkerboard.lz4 > ./patterns/checkerboard.c
	./tools/bin2c.exe sonicsky < patterns/sonicsky.lz4 > ./patterns/sonicsky.c
	./tools/bin2c.exe sonicback1 < patterns/sonicback1.lz4 > ./patterns/sonicback1.c
	./tools/bin2c.exe sonicback2 < patterns/sonicback2.lz4 > ./patterns/sonicback2.c
	./tools/bin2c.exe sonicback3 < patterns/sonicback3.lz4 > ./patterns/sonicback3.c
	./tools/bin2c.exe sonicback4 < patterns/sonicback4.lz4 > ./patterns/sonicback4.c
	./tools/bin2c.exe sonicfloor < patterns/sonicfloor.lz4 > ./patterns/sonicfloor.c
	./tools/bin2c.exe kiki < patterns/kiki.lz4 > ./patterns/kiki.c
	./tools/bin2c.exe motoko < patterns/motoko.lz4 > ./patterns/motoko.c
	./tools/bin2c.exe striped < patterns/striped.lz4 > ./patterns/striped.c
	./tools/bin2c.exe buzzbomber < patterns/buzzbomber.lz4 > ./patterns/buzzbomber.c
	./tools/bin2c.exe buzzbombershadow < patterns/buzzbombershadow.lz4 > ./patterns/buzzbombershadow.c
	./tools/bin2c.exe shadow < patterns/shadow.lz4 > ./patterns/shadow.c
	./tools/bin2c.exe font < patterns/font.lz4 > ./patterns/font.c
	./tools/bin2c.exe circle < patterns/circle.lz4 > ./patterns/circle.c
	./tools/bin2c.exe numbers < patterns/numbers.lz4 > ./patterns/numbers.c
	./tools/bin2c.exe lagper < patterns/lagper.lz4 > ./patterns/lagper.c
	./tools/bin2c.exe back < patterns/back.lz4 > ./patterns/back.c
	./tools/bin2c.exe backw256 < patterns/backw256.lz4 > ./patterns/backw256.c
	./tools/bin2c.exe beep < resources/beep.raw> ./resources/beep.h
	./tools/bin2c.exe gillian < patterns/gillian.lz4> ./patterns/gillian.c
	./tools/bin2c.exe convergence < patterns/convergence.lz4> ./patterns/convergence.c

clean:
	rm -f ./resources/beep.raw ./resources/beep.h
	rm -rf binary
	rm -rf patterns