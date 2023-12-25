TARGET_ELF = main.elf
LD 	   = arm-none-eabi-ld
AS	   = arm-none-eabi-as
GDB 	   = gdb-multiarch
CPU	   = cortex-m0

# Assembler
AS_FLAGS = -mcpu=$(CPU) -mthumb -g

# Linker
LD_SCRIPT = STM32F030R8.ld
LSCRIPT   = ./$(LD_SCRIPT)
LFLAGS   += -T$(LSCRIPT)

# Sources and objects
AS_SRC  = ./core.S
AS_SRC += ./main.S
OBJS    = $(AS_SRC:.S=.o)

.PHONY: all
all: $(TARGET_ELF)
%.o: %.S
	$(AS) $(AS_FLAGS) $< -o $@

$(TARGET_ELF): $(OBJS)
	$(LD) $(OBJS) $(LFLAGS) -o $@

.PHONY: clean
clean:
	$(RM) $(OBJS)
	$(RM) $(TARGET_ELF)

.PHONY: flash
flash:
	$(GDB) $(TARGET_ELF) -ex 'target extended-remote :4242' -ex 'load' -ex 'set confirm off' -ex 'exit'

.PHONY: gdb
gdb:
	$(GDB) $(TARGET_ELF) -ex 'target extended-remote :4242'
