DIR_BUILD=./build
DIR_SRC = ./src
CC=gcc
AS=nasm
# 汇编参数
AS_FLAGS= -f elf32
BIN_BOOT = $(DIR_BUILD)/boot.bin

all:$(DIR_BUILD) $(BIN_BOOT) $(IMG)

$(DIR_BUILD):
	mkdir -p $(DIR_BUILD)

# 编译boot
$(BIN_BOOT):$(DIR_SRC)/boot.asm
	$(AS) -o $@ $<
clean:
	rm -fr $(DIR_BUILD)
test: