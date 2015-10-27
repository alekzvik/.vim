#!/bin/bash

FILES = .bashrc .gitconfig .jshintrc .vimrc .tmux.conf
all:
	$(foreach file,$(FILES),ln -fs $(file) ~/$(file);)

