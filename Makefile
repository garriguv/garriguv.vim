.PHONY: install
install:
	ln -si $(shell pwd)/vimrc ~/.vimrc
	ln -si $(shell pwd)/ideavimrc ~/.ideavimrc
	ln -siF $(shell pwd)/pack/ ~/.vim
	ln -siF $(shell pwd)/ftplugin/ ~/.vim

.PHONY: update
update:
	git submodule update --remote --merge
