# Verbose: @ = no verbose,  = verbose
V = @

# Name of the executable
NAME =  asmr
BONUS = bonus_asmr

# Name of the library
LIB_NAME = libasm.a

# Directories
DIR = src
BONUS_DIR = $(DIR)/bonus

# Source files
SRC =	ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s

BONUS_SRC = ft_atoi_base_bonus.s

MAIN = main.c

# AS compiler
AS = $(V)nasm
ASFLAGS = -f elf64

# C compiler
CC = $(V)clang
CFLAGS = -Wall -Wextra -Werror -MMD -MP

# Linker
LINKER = ar rcs

# Remove
RM = rm -f



# Do not change
# these are the files that will be compiled
SRCS = $(addprefix $(DIR)/, $(SRC))
MAIN_SRCS = $(addprefix $(DIR)/, $(MAIN))
BONUS_SRCS = $(addprefix $(BONUS_DIR)/, $(BONUS_SRC))

LIB = $(DIR)/$(LIB_NAME)
BONUS_LIB = $(BONUS_DIR)/$(LIB_NAME)

ASM_OBJ = $(SRCS:.s=.o)
C_OBJ = $(MAIN_SRCS:.c=.o)
OBJ = $(ASM_OBJ) $(C_OBJ)
BONUS_OBJ = $(BONUS_SRCS:.s=.o) $(OBJ)

# Dependency
DEPEND = $(MAIN_SRCS:.c=.d)


# Rules
.PHONY: all
all: $(NAME)

.PHONY: bonus
bonus: $(BONUS)

.PHONY: lib
lib: $(LIB)

.PHONY: lib_bonus
lib_bonus: $(BONUS_LIB)

$(NAME): $(LIB)
	$(V)$(CC) -o $(NAME) -lasm $(C_OBJ) $(LIB)
	$(V)echo "Mandatory done"

$(BONUS): $(BONUS_LIB)
	$(V)$(CC) -o $(BONUS) -D BONUS=1 -lasm $(MAIN_SRCS) $(BONUS_LIB)
	$(V)echo "Bonus done"

$(LIB): $(OBJ)
	$(V)$(LINKER) $(LIB) $(ASM_OBJ)
	$(V)ranlib $(LIB)
	$(V)echo "Lib done"

$(BONUS_LIB): $(BONUS_OBJ)
	$(V)$(LINKER) $(BONUS_LIB) $(ASM_OBJ) $(BONUS_OBJ)
	$(V)ranlib $(BONUS_LIB)
	$(V)echo "Bonus lib done"

.PHONY: clean
clean:
	$(V)$(RM) $(BONUS_OBJ) $(DEPEND)
	$(V)echo "Clean done"

.PHONY: fclean
fclean: clean
	$(V)$(RM) $(NAME) $(LIB)
	$(V)$(RM) $(BONUS) $(BONUS_LIB)
	$(V)echo "Fclean done"

.PHONY: re
re: fclean all

.PHONY: re
re-bonus: fclean bonus
