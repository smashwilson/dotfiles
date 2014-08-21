#!/bin/bash

if test ! $(which rbenv)
then
  echo "  Installing rbenv for you."
  git clone https://github.com/sstephenson/rbenv.git ${HOME}/.rbenv
fi

if [ ! -d ${HOME}/.rbenv/plugins/ruby-build ]
then
  echo "  Installing ruby-build for you."
  git clone https://github.com/sstephenson/ruby-build.git ${HOME}/.rbenv/plugins/ruby-build
fi
