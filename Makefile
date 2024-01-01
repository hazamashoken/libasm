
# Name of the executable
NAME =  asm
LIB_NAME = libasm.a
DIR = src

SRC =	ft_strlen.asm \
		ft_strcpy.asm \
		ft_strcmp.asm \
		ft_write.asm

MAIN = main.c

# Compiler
ASM = nasm
CC = clang
CFLAGS = -Wall -Wextra -Werror
LINKER = ar rcs

# Do not change
SRCS = $(addprefix $(DIR)/, $(SRC))
MAIN_SRCS = $(addprefix $(DIR)/, $(MAIN))

LIB = $(DIR)/$(LIB_NAME)

ASM_OBJ = $(SRCS:.asm=.o)
C_OBJ = $(MAIN_SRCS:.c=.o)
OBJ = $(ASM_OBJ) $(C_OBJ)

all: $(NAME)

lib: $(LIB)

$(NAME): $(LIB)
	$(CC) -v -o $(NAME) -lasm $(C_OBJ) $(LIB) -fPIE

$(LIB): $(OBJ)
	$(LINKER) $(LIB)  $(ASM_OBJ)
	ranlib $(LIB)

%.o: %.c
	$(CC)  -c $< -o $@

%.o: %.asm
	$(ASM) -f elf64 $< -o $@


clean:
	rm -f **/*.o

fclean: clean
	rm -f $(NAME)
	rm -f $(LIB)

re: fclean all

.PHONY: all clean fclean re make_o lib
