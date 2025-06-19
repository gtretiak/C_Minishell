# Minishell: Building a Custom Shell from Scratch
## 📋 Overview
Minishell, or in other words, the command-line interpreter, is a custom implementation of a basic shell, similar to bash, but with a reduced feature set. The program allows users to interact with their operating system through text commands indirectly exploiting process management, file descriptors, signal handling, and parsing techniques.
![minishell_architecture_revised](images/minishell_architecture_revised.png)
![minishell_builtins_revised](images/minishell_builtins_revised.png)
![minishell_redirections_pipes_revised](images/minishell_redirections_pipes_revised.png)
![minishell_commands_revised](images/minishell_commands_revised.png)

## 🎯 Project Purpose & Objectives
1. Gain a deep understanding of how shells work under the hood
2. Master process creation, management, and inter-process communication
3. Implement a robust command parser that handles complex syntax
4. Manage program execution flow with proper signal handling
5. Create a system that correctly manages environment variables and execution contexts
 
The final result is a lightweight but powerful shell that can handle most daily command-line tasks.
## 🔑 Key Concepts & Features
1. Core Shell Functionality
- Command prompt with working command history
- Command execution from PATH or absolute/relative paths
- Environment variable expansion (including $?)
- Signal handling (Ctrl+C, Ctrl+D, Ctrl+)
2. Built-in Commands
- echo (with -n option)
- cd (with relative or absolute paths)
- pwd
- export (environment variable management)
- unset (environment variable removal)
- env (display environment variables)
- exit
3. Input/Output Handling
- Input redirection (<)
- Output redirection (>)
- Append output redirection (>>)
- Heredoc functionality (<<)
- Pipes (|) for connecting multiple commands
4. Parsing
- Quote handling (single ' and double " quotes)
- Command separation and organization
- Proper error handling for syntax issues
## 🧰 Technical Implementation Details
### Architecture
The project is organized into several key components:
 
* Lexical Analyzer (Lexer): Converts raw input strings into tokens
* Parser: Organizes tokens into a structured command representation
* Executor: Executes the parsed commands with proper process management
* Built-in Command Handler: Implements shell built-in commands
* Signal Handler: Manages signal processing and program flow control
* Environment Manager: Handles environment variable storage and manipulation

### Key Algorithms & Approaches

* Recursive Descent Parsing: Used to handle the command grammar and nested structures
* Process Management: Fork/exec pattern for command execution
* Token-based Command Processing: Breaking complex commands into manageable components
* Pipe and Redirection Handling: Using file descriptor manipulation techniques
* State Machine Design: For robust parsing of complex command syntax

### Libraries & Technologies
* C Standard Library: Core implementation using standard C
* Readline Library: For input handling and history management
* Libft: Custom implementation of standard library functions (part of 42 curriculum)
* POSIX System Calls: For process management and file operations

## 🚀 Setup & Installation
1. Clone the repository, cd there
2. Compile with make command
3. run ./minishell

## 🌍 Real-World Applications
1. Systems Programming: process management, signal handling, and file descriptors are essential for developing system-level software, daemons, and services that need to interact with the operating system.
2. DevOps & Automation: Knowledge of shell behavior and command execution is crucial when creating robust CI/CD pipelines, deployment scripts, and infrastructure automation tools.
3. Security Software Development: Understanding how commands are parsed and executed helps in creating secure software that properly sanitizes user inputs and prevents command injection vulnerabilities.
4. Embedded Systems: Lightweight command interfaces are often needed in resource-constrained environments like embedded systems, where this minimalist approach to shell implementation is valuable.
5. Custom CLI Tools: This foundation enables the development of specialized command-line interfaces for various applications, from database clients to network diagnostic tools.

## 🏁 Conclusion
The Minishell project gives a solid understanding of fundamental operating system concepts and C programming. The knowledge gained from implementing a command interpreter with support for pipes, redirections, and built-in commands, is directly applicable to developing system utilities, backend services, and any software that requires deep integration with the operating system.
