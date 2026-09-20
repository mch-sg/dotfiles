input="$*"

cd /Users/mhvidtfeldt/dtu/3-semester/02635-pms/psets
mkdir $input
cd $input
mkdir exercises
cat > $input.c <<EOF
#include <stdio.h>
#include <math.h>

int main(void) {
	
	return 0;
}
EOF

cat > Makefile <<EOF
CC=gcc
CFLAGS=-Wall -Wfloat-equal -Wvla
obj=$(patsubst %.c,%.o,$(wildcard *.c))

myprogram: $(obj)

.PHONY: clean
clean:
	-$(RM) myprogram $(obj)
EOF

