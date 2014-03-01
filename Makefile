include config.mk

SRC = lsqlite3.c
OBJ = ${SRC:.c=.o}

all: lsqlite3.so

.c.o:
	${CC} -c -o $@ ${CFLAGS} $<

${OBJ}: config.mk

lsqlite3.so: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	rm -f lsqlite3.so ${OBJ} test.db

install: all
	mkdir -p ${DESTDIR}${PREFIX}/lib/lua/${LUA}
	cp -f lsqlite3.so ${DESTDIR}${PREFIX}/lib/lua/${LUA}/

test: all
	./test.lua

.PHONY: all clean install test
