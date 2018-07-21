.PHONY: build test

build: libqrcode.a

libqrcode.a: QR_Encode.o
	ar crv $@ QR_Encode.o

QR_Encode.o: QR_Encode.c QR_Encode.h
	gcc -c QR_Encode.c

test: test_qrcode.bin

test_qrcode.bin: test.c
	gcc test.c -L. -lqrcode
	mv a.out test_qrcode.bin

clean:
	rm -f *.o *.a *.bin
