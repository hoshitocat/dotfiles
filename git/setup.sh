#! /bin/bash

BASEDIR=$PWD/$(dirname $0)

case "$OSTYPE" in
  darwin* )
    echo 'create git config symbolic link for Mac...'
    ln -sf $BASEDIR/darwin.gitconfig $BASEDIR/config
    ;;
  "linux-gnu" )
    echo 'create git config symbolic link for Linux...'
    ln -sf $BASEDIR/linux.gitconfig $BASEDIR/config
    ;;
esac

cp -f $BASEDIR/.gitconfig ~
