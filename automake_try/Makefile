CC = gcc 
CPP = gcc -E
CFLAGS = -I ./include -g
SOURCES = $(wildcard src/*.c)
HEADERS = 
OBJS = ${SOURCES:%.c=%.o}
 
# self-defined
BIN = ./bin/test
LIBS = 
 
all: $(BIN)
	@echo "*****Make done*****"
	@echo "*****/bin/main*****"
	@echo "*******************"
	@echo ${SOURCES}
	@echo ${OBJS}
 
$(BIN): $(OBJS)
	$(CC) -o $@ $^ $(LIBS) ${CFLAGS}
	-rm ${OBJS}

clean:
	rm -f $(OBJS) $(BIN)