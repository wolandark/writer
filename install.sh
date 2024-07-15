#!/bin/sh 

# Vars
_THESAURUS_PATH="$HOME/.vim/thesaurus/"
_THESAURUS_URL="https://www.gutenberg.org/files/3202/files/mthesaur.txt"
_THESAURUS_FILE="mthesaur.txt"

_LANGUAGE_TOOL_PATH="$HOME/.vim/languagetool/"
_LANGUAGE_TOOL_URL="https://languagetool.org/download/LanguageTool-5.2.zip"
_LANGUAGE_TOOL_ZIP="LanguageTool-5.2.zip"
_LANGUAGE_TOOL_DIR="LanguageTool-5.2"

_VIMRC="$parent_dir/vimrc"
_VIMRC_PATH="$HOME/.vim/"

parent_dir=$(basename "$(pwd)")

# Funcs
SetUpPaths()
{
	mkdir -p "$_THESAURUS_PATH"
	mkdir -p "$_LANGUAGE_TOOL_PATH"
}

DownloadTools()
{
	printf "Downloading thesaurus source\n"
	curl -Lo "$_THESAURUS_FILE" "$_THESAURUS_URL"
	printf "Downloading languagetool source\n"
	curl -Lo "$_LANGUAGE_TOOL_ZIP" "$_LANGUAGE_TOOL_URL"
}

UnZip()
{
	unzip "$_LANGUAGE_TOOL_ZIP"
}

ToDestination()
{
	mv "$_LANGUAGE_TOOL_DIR" "$_LANGUAGE_TOOL_PATH"
	mv "$_THESAURUS_FILE" "$_THESAURUS_PATH"
	cp "$_VIMRC" "$_VIMRC_PATH"
}

main()
{
	SetUpPaths
	DownloadTools
	UnZip
	ToDestination
}
main

# Run Vim for plugin installation
vim

exit 0
