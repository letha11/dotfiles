#!/bin/bash

DIR=${PWD}

#
# Neovim/nvim (NVChad)
#
NVCHAD_CONFIG_HOME="$HOME/.config/nvim/lua"
NVCHAD_CUSTOM_CONFIG_PATH="$NVCHAD_CONFIG_HOME/custom"
# -d = directory check
# -L = symlink check
#if [ -d $NVCHAD_CUSTOM_CONFIG_PATH ] && [ ! -L $NVCHAD_CUSTOM_CONFIG_PATH ]
#then
  #mv $NVCHAD_CUSTOM_CONFIG_PATH "$NVCHAD_CONFIG_HOME/custom.old"
  #ln -s "$DIR/.config/nvim/lua/custom" "$NVCHAD_CONFIG_HOME/custom" &
  #echo "Successfully create symlink for custom config of nvchad."
#fi

if [[ -d $HOME/.config/nvim ]];
then
	read -p "Neovim configuration exists, do you want to replace it [y/n] ? " REPLACE_NVIM
	
	if [[ $REPLACE_NVIM = "y" ]];
	then
		mv $HOME/.config/nvim $HOME/.config/nvim.old
		ln -s "$DIR/.config/nvim" "$HOME/.config/nvim"
		#echo "Previous neovim configuration directory changed to \'nvim.old\'"
	fi

else
	ln -s "$DIR/.config/nvim" "$HOME/.config/nvim"
fi


#
# zsh
#
# Installing zoxide
if [[ ! -f "$HOME/.local/bin/zoxide" ]]; # zoxide doesnt exist
then
  curl -sS "https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh" | bash
fi

 #installing starship
if [[ ! -f "/usr/local/bin/starship" ]]; # starship doesnt exist
then
  curl -sS "https://starship.rs/install.sh" | sh
fi

# -f = file check
# -L = symlink check
ZSHRC_PATH="$HOME/.zshrc"
if [[ ! -f $ZSHRC_PATH ]];
then
  ln -s "$DIR/.zshrc" "$ZSHRC_PATH"
elif [[ -f $ZSHRC_PATH && ! -L $ZSHRC_PATH ]]; 
then
  mv $ZSHRC_PATH "$HOME/.zshrc.old"
  ln -s "$DIR/.zshrc" "$ZSHRC_PATH"
fi

if [[ ! -f "$HOME/.zprofile" ]];
then
  touch ~/.zprofile
fi

#
# Alacritty
#
ALACRITTY_CONFIG_PATH="$HOME/.config/alacritty"
if [[ ! -d  $ALACRITTY_CONFIG_PATH ]];
then 
  ln -s "$DIR/.config/alacritty" $ALACRITTY_CONFIG_PATH
elif [[ -d $ALACRITTY_CONFIG_PATH && ! -L $ALACRITTY_CONFIG_PATH ]];
then
  mv $ALACRITTY_CONFIG_PATH "$ALACRITTY_CONFIG_PATH.old"
  ln -s "$DIR/.config/alacritty" $ALACRITTY_CONFIG_PATH
fi

#
# Tmux
# 
DEFAULT_TMUX_CONFIG_PATH="$HOME/.tmux.conf"
TMUX_CONFIG_PATH="$HOME/.config/tmux"
if [[ -f $DEFAULT_TMUX_CONFIG_PATH ]];
then
  echo "Default tmux config path exists, renaming to '.tmux.conf.old' to avoid confusion"
  mv $DEFAULT_TMUX_CONFIG_PATH "$DEFAULT_TMUX_CONFIG_PATH.old"
fi

if [[ ! -d $TMUX_CONFIG_PATH ]];
then
  ln -s "$DIR/.config/tmux" $TMUX_CONFIG_PATH
elif [[ -d $TMUX_CONFIG_PATH && ! -L $TMUX_CONFIG_PATH ]];
 then
  mv $TMUX_CONFIG_PATH "$TMUX_CONFIG_PATH.old"
  ln -s "$DIR/.config/tmux" $TMUX_CONFIG_PATH
fi


# #
# # i3
# #
#
I3_CONFIG_PATH="$HOME/.config/i3"
if [[ ! -d $I3_CONFIG_PATH ]];
then
  ln -s "$DIR/.config/i3" $I3_CONFIG_PATH
elif [[ -d $I3_CONFIG_PATH && ! -L $I3_CONFIG_PATH ]];
then
  mv $I3_CONFIG_PATH "$I3_CONFIG_PATH.old" 
  ln -s "$DIR/.config/i3" $I3_CONFIG_PATH
fi

I3BLOCKS_CONFIG_PATH="$HOME/.config/i3blocks"
if [[ ! -d $I3BLOCKS_CONFIG_PATH ]];
then
  ln -s "$DIR/.config/i3blocks" $I3BLOCKS_CONFIG_PATH
elif [[ -d $I3BLOCKS_CONFIG_PATH && ! -L $I3BLOCKS_CONFIG_PATH ]];
then
  mv $I3BLOCKS_CONFIG_PATH "$I3BLOCKS_CONFIG_PATH.old" 
  ln -s "$DIR/.config/i3blocks" $I3_CONFIG_PATH
fi

