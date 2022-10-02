# Dotfiles

This is my dotfiles directory. It allows for me to easily install and configure all of my favorite software easily. 

## Usage 
To symlink all files, run 
```bash
$ ./init_dotfiles.sh
```

The `init_dotfiles.sh` script will prompt for the home directory there is no `home_directory` file in this repo, and copy all files within this repo (maintaining folder structure) to the home directory specified. The script will also store this directory in the `home_directory` file for future use. If the script overwrote any files they will be stored under `$home_directory/dotfiles_old`. As a note any files in the `dotfiles_old` directory will also be overwritten after each use. 


## Configurations

A quick note about configuration: The main reason for this repository is NOT for it to used by other people. If you wish to use it, use it at your own risk. There are many things that are specific to the comptuers that I use, and special notes I have about configuration that I do not have documented here. Hopefully the notes in this README are enough for anyone to properly configure everything (because that means I don't have to rely on keeping any configuration notes in my head" but that is not the main purpose.

The main purpose is for ME to quickly configure my workspaces. 


### Neovim

Currently this repository contains all of my neovim configurations. In order for it to work correctly, the following must also be installed (will most likely include
auto installation scripts for this in the future" 

- vim plug 
- Rust compilation toolchain (specifiically rls) 
- tsserver, typescript language server
- Pyright, python language server 
- clangd, c language server 

### ZSH



## Future additions

In the future, I want to set up the following additions

### Configurations

As well as an auto installer, that auto installs and keeps various software up to date

### Installations
 - All language servers that are mentioned in the [Neovim](#Neovim) section
 - Neovim 
 - Git 
 - Markdown Compiler 
 - Latex Compiler
