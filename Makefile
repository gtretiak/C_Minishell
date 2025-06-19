CC = cc
CFLAGS = -Wall -Wextra -Werror -g
INCLUDES = -I./Libft
LIBS = -lreadline -L./C_libft -lft
NAME = minishell
LIBFT = libft.a
LIBFT_DIR = C_libft/
SRCS = \
	./fill_pipes_cmd2.c \
	./fill_pipes_cmd.c \
	./builtin/exec_echo.c \
	./builtin/exec_cd.c \
	./builtin/exec_echo2.c \
	./builtin/exec_exit.c \
	./builtin/exec_echo_utils.c \
	./builtin/exec_echo_nl_flag.c \
	./builtin/export_4.c \
	./builtin/exec_pwd.c \
	./builtin/export_3.c \
	./builtin/exec_export_expansion.c \
	./builtin/exec_env.c \
	./builtin/export_utils.c \
	./builtin/exec_export_main.c \
	./builtin/exec_echo_redirection.c \
	./builtin/exec_cd_3.c \
	./builtin/exec_unset.c \
	./builtin/exec_cd_2.c \
	./builtin/exec_echo_processing.c \
	./signals_settings.c \
	./utils.c \
	./term_evaluation.c \
	./init2.c \
	./exec/commands.c \
	./exec/commands2.c \
	./exec/utils.c \
	./exec/redirections2.c \
	./exec/execute_command2.c \
	./exec/utils2.c \
	./exec/builtin.c \
	./exec/pipeline_exec.c \
	./exec/bultin2.c \
	./exec/execute_command.c \
	./exec/pipeline_utils.c \
	./exec/redirections.c \
	./exec/pipeline_exec2.c \
	./exec/exec.c \
	./init.c \
	./operations.c \
	./argument_validation.c \
	./signals_updates.c \
	./main.c \
	./expr_processing.c \
	./errors.c \
	./parsing/token_processor.c \
	./parsing/quotes_handler_removing.c \
	./parsing/args_manager.c \
	./parsing/command_processing.c \
	./parsing/lexer_handle_char.c \
	./parsing/quotes_handler.c \
	./parsing/token_processor2.c \
	./parsing/parser.c \
	./parsing/lexer_init_and_free.c \
	./parsing/command_spec_handler.c \
	./parsing/quotes_handler_validation.c \
	./parsing/command_utils.c \
	./parsing/command_handler2.c \
	./parsing/command_processing2.c \
	./parsing/command_handler.c \
	./parsing/lexer_handle_tokens.c \
	./parsing/token_processor3.c \
	./input.c \
	./free2.c \
	./free.c

OBJS = $(SRCS:.c=.o)

all: $(LIBFT) $(NAME)

$(LIBFT):
	@if [ -d $(LIBFT_DIR) ]; then \
		echo "C-libft is already cloned."; \
	else \
		git clone git@github.com:gtretiak/C_libft.git $(LIBFT_DIR); \
	fi
	@if [ -f $(LIBFT_DIR)$(LIBFT) ]; then \
		echo "libft.a is already compiled."; \
	else \
		$(MAKE) -C $(LIBFT_DIR); \
	fi

$(NAME): $(OBJS)
	@if [ ! -f $(NAME) ] || [ $(LIBFT) -nt $(NAME) ]; then \
		make -C $(LIBFT_DIR); fi
	$(CC) $(CFLAGS) $(OBJS) $(LIBS) -o $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	@if [ -d $(LIBFT_DIR) ]; then make clean -C $(LIBFT_DIR); fi
	rm -f $(OBJS)

fclean: clean
	@if [ -d $(LIBFT_DIR) ]; then rm -rf $(LIBFT_DIR); fi
	@if [ -f $(NAME) ]; then rm -f $(NAME); fi

re: fclean all

.PHONY: all clean fclean re
