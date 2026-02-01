{ pkgs, ... }: {
  home.username = "gburroughs";
  home.homeDirectory = "/home/gburroughs";
  home.stateVersion = "23.11";

  # 1. Packages (Binaries)
  home.packages = with pkgs; [
    fzf
    ripgrep
    bat
    # Rust Tooling
    rustc
    cargo
    rust-analyzer # The LSP
  ];

  # 2. ZSH & Oh-My-Zsh
  programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "amuse";
      };

      initContent = ''
        # Aliases
        alias v="nvim"
        alias vimconfig="v ~/.config/nvim"
        alias cheatsheet="v ~/.cheatsheet.md"

        gtouch() {
          if [ -z $1 ]; then
            echo "usage: gtouch <file>";
          else
            touch $1 && git add $1;
          fi
        }

        pdfgen() {
          if [ -z $1 ]; then
            echo "usage: pdfgen <file>";
          else
            pandoc $1.md -o $1.pdf && xdg-open $1.pdf;
          fi
        }

        # Your NVM and local source logic
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        
        touch ~/.zshlocal
        source ~/.zshlocal
      '';
    };

  # 3. Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # 4. Existing Dotfiles Integration
  # This symlinks your existing git repo files into the right place
  home.file.".config/nvim".source = ./.config/nvim; 
  home.file.".zshrc".source = ./.zshrc; 
}
