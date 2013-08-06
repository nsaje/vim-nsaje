#!/bin/bash

echo "Pulling from repo"
git pull

echo "Installing Vundle bundles"
vim +BundleInstall +qall

echo "Update complete".
