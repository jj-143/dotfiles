#!/bin/bash

here=$(dirname "$(realpath $0)")

for df in .zshrc .vimrc .tmux.conf; do
  ln -s "$here"/"$df" "$HOME"/$df
  if [ $? -eq 0 ]; then
    echo symlinked $df to "$HOME"/$df
  fi
done


#
# install zsh plugins
#
autosuggestions="https://github.com/zsh-users/zsh-autosuggestions"
syntax_highlighting="https://github.com/zsh-users/zsh-syntax-highlighting"
plugins=($autosuggestions $syntax_highlighting)

for plugin in "${plugins[@]}"; do
  git -C ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/ clone  $plugin 
  if [ $? -eq 0 ];then
    echo "plugin installed: ${plugin}"
  fi
done

