#!/bin/sh

# Stops script execution if a command has an error
set -e

INSTALL_ONLY=0
# Loop through arguments and process them: https://pretzelhands.com/posts/command-line-flags
for arg in "$@"; do
    case $arg in
        -i|--install) INSTALL_ONLY=1 ; shift ;;
        *) break ;;
    esac
done

if ! hash go 2>/dev/null; then
    echo "Installing Go Interpreter"
    apt-get update
    apt-get install -y golang-go
    # Set env variables?:
    # export GOROOT=/usr/local/go
    # export GOPATH=$HOME/go
    # export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
else
    echo "Go Interpreter is already installed"
fi

# Run
if [ $INSTALL_ONLY = 0 ] ; then
    echo "Use go via command-line"
    go --help
    sleep 20
fi
