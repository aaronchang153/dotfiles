#!/bin/bash

# Check for existence of ~/.tmux/plugins/tpm
if [[ -d ${HOME}/.tmux/plugins/tpm ]]; then
 echo "Error: ${HOME}/.tmux/plugins/tpm directory already exists."
 exit 1
fi

# Check for existence of ~/.config/tmux
if [[ -d ${HOME}/.config/tmux ]]; then
 echo "Error: ${HOME}/.config/tmux directory already exists."
 exit 1
fi

# Check for existence of "tmux.conf" in the current directory
current_dir=$(pwd)
conf_abs_path="$current_dir/tmux.conf"
if [[ ! -f "$conf_abs_path" ]]; then
 echo "Error: tmux.conf file does not exist in the current directory."
 exit 1
fi

git clone https://github.com/tmux-plugins/tpm.git ${HOME}/.tmux/plugins/tpm
mkdir ${HOME}/.config/tmux
ln -s $conf_abs_path ${HOME}/.config/tmux/tmux.conf

echo "Setup complete for tmux. Don't forget to do <prefix>I inside tmux to install plugins."

