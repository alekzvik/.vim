#!/bin/bash

REPO = `pwd`
FILES = .bashrc .gitconfig .jshintrc .vimrc .tmux.conf
all:
	$(foreach file,$(FILES),ln -fs $(REPO)/$(file) ~/$(file);)

