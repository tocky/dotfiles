#!/bin/bash

DOTFILES=(
  .zshrc .zshrc.alias .zshrc.osx .zshrc.linux
  .gitconfig .gitignore
)

echo "Create symbolic links..."

for file in ${DOTFILES[@]}
do
  if [[ -e ${HOME}/${file} ]]; then
    echo -n "Replace ${HOME}/${file}? [y/N] "
    read ANSWER
    if [ "${ANSWER}" = 'y' -o "${ANSWER}" = 'yes' ]; then
      rm ${HOME}/${file}
    else
      continue
    fi
  fi
  ln -s ${HOME}/dotfiles/$file ${HOME}/${file}
done

echo "Setup process has done!"
