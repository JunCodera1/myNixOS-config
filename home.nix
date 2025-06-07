{ config, pkgs, lib , system, inputs, ... }:

{
  home.username = lib.mkForce "jun";
  home.homeDirectory = lib.mkForce "/home/jun";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    zip
    xz
    unzip
    p7zip
    oh-my-zsh
   oh-my-posh
   osu-lazer-bin
    inputs.zen-browser.packages.${system}.default
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "notquitethereyet";
    userEmail = "example@example.com";
    extraConfig = {
        init.defaultBranch = "main";
    };
  };
# Catpussy thing
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "blue";
  };



  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
