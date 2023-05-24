#!/bin/bash

DIR=${PWD}
stow -t ~/.config/ .config/
ln -s "${DIR}/.zshrc" ~/.zshrc

# stow .
