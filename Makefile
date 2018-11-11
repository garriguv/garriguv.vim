.PHONY: install
install:
	ln -si $(shell pwd)/vimrc ~/.vimrc
	ln -si $(shell pwd)/ideavimrc ~/.ideavimrc
	ln -si $(shell pwd)/gvimrc ~/.gvimrc
	ln -siF $(shell pwd)/pack/ ~/.vim/pack
	ln -siF $(shell pwd)/ftplugin/ ~/.vim/ftplugin

.PHONY: update
update:
	git submodule update --remote
