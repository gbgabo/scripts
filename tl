# tl - terminal launch: allows to launch  a series of commands in a new terminal window
# usage: tl 'command-one; command-two'
command=$1
x-terminal-emulator -e "bash -c 'cd $HOME; $command; zsh'"
