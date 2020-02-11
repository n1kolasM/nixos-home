{ config, pkgs, libs, ... }:
{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "fancy-ctrl-z"
        "sudo"
      ];
      theme = "agnoster";
    };
    plugins = [
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "35c8690c0025ceef9584f64da86ced3a72ee32b6";
          sha256 = "18wsrxaclhy0mql8rsvjg1m9vhxnkr7ggb7nkr2vma74fbmryynd";
        };
      }
    ];
  };
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-fugitive
      nerdtree
      vim-surround
      vim-commentary
      lightline-vim
      awesome-vim-colorschemes
    ];
    extraConfig = ''
      " Local .vimrc for projects
      set exrc
      set secure

      " Global indentation
      set shiftwidth=4
      set tabstop=4
      set softtabstop=4
      set smarttab
      set expandtab

      " Status line
      set laststatus=2
      set noshowmode

      set clipboard=unnamedplus
    '';
  };
  programs.git.enable = true;
  programs.tmux.enable = true;
  programs.gpg.enable = true;
  home.packages = with pkgs; [
    htop
    mc
    nur.repos.n1kolasM.neovim-gtk
  ];
}
