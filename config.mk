# versions
VERSION = 0.9.1
LUA = 5.2

# paths
PREFIX ?= /usr/local

LUAINC ?= -I/usr/local/include -I/usr/local/include/lua-${LUA}
LUALIB ?= -L/usr/local/lib

# flags
CFLAGS += -fPIC -Wall -Os ${LUAINC}
LDFLAGS += -shared ${LUALIB} -lsqlite3

# compiler and linker
CC ?= cc
