.PHONY: all 

all:  init python necessary xilinx
VISUDO_FILE := /etc/apt/sources.list
source:
	@if [ -e "/etc/apt/sources.list.bak" ];\
	then\
		echo "aleardy copy $(VISUDO_FILE) as '/etc/apt/sorces.list.bak'";\
	else\
		sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak;\
	fi
	
	@if [ -e "/etc/apt/sources.list.bak" ];\
	then\
		sudo apt-get update;\
		sudo apt-get upgrade -y;\
		sudo chmod 777 $(VISUDO_FILE);\
		echo "----update & upgrade success----";\
		echo "------change the apt source-----";\
		sudo bash -c 'echo "deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse" > $(VISUDO_FILE)';\
		sudo bash -c 'echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse" >> $(VISUDO_FILE)';\
		sudo bash -c 'echo "deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse" >> $(VISUDO_FILE)';\
		sudo bash -c 'echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse" >> $(VISUDO_FILE)';\
		sudo bash -c 'echo "deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse" >> $(VISUDO_FILE)';\
		sudo bash -c 'echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse" >> $(VISUDO_FILE)';\
		sudo bash -c 'echo "deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse" >> $(VISUDO_FILE)';\
		sudo bash -c 'echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse" >> $(VISUDO_FILE)';\
		sudo bash -c 'echo "deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse" >> $(VISUDO_FILE)';\
		sudo bash -c 'echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse" >> $(VISUDO_FILE)';\
		sudo chmod 444 $(VISUDO_FILE);\
		echo "------A/T update & upgrade------";\
		sudo apt-get update && sudo apt-get upgrade -y;\
		echo "----update & upgrade success----";\
	fi
init:
	sudo apt-get update && sudo apt-get upgrade -y
	sudo apt update && sudo apt upgrade -y
	sudo apt-get install vim -y
	sudo apt install ssh -y
	sudo apt install net-tools -y
python:
	sudo apt install python3
	sudo apt install python3-pip -y
	-sudo rm /usr/bin/python
	sudo ln -s /usr/bin/python3 /usr/bin/python
	-sudo ln -s /usr/bin/pip3 /usr/bin/pip
necessary:
	sudo apt-get install build-essential        # build-essential packages, include binary utilities, gcc, make, and so on
	sudo apt-get install man                    # on-line reference manual
	sudo apt-get install gcc-doc -y             # on-line reference manual for gcc
	sudo apt-get install gdb                    # GNU debugger
	sudo apt-get install git -y                 # revision control system
	sudo apt-get install libreadline-dev -y     # a library used later
	sudo apt-get install libsdl2-dev -y         # a library used later
	sudo apt-get install llvm llvm-dev -y       # llvm project, which contains libraries used later
#	sudo apt-get install llvm-11 llvm-11-dev -y # only for ubuntu20.04
	sudo apt-get install bison -y
xilinx:
	sudo apt-get install libncurses5 -y
	sudo apt-get install libtinfo5
	sudo apt-get install libncurses5-dev libncursesw5-dev
update:
	sudo apt-get update && sudo apt-get upgrade -y