#/bin/bash

here=$(dirname "$(realpath $0)")

for df in .zshrc .vimrc .tmux.conf; do
  ln -s "$here"/"$df" "$HOME"/$df
  if [ $? -eq 0 ]; then
    echo copied $df to "$HOME"/$df
  fi
done
