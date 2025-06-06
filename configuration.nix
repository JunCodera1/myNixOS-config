{ config, pkgs, ... }:

let
  aagl-gtk-on-nix = import (builtins.fetchTarball {
    url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
    sha256 = "1j4lppqrlg2vkvw601igrs85f1dnvrs401879mvgzdnp6a31sq8n";

  });
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      aagl-gtk-on-nix.module
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Ho_Chi_Minh";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "vi_VN";
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    #waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-anthy
      fcitx5-unikey
      fcitx5-chinese-addons
      fcitx5-nord
    ];
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.jun = {
    isNormalUser = true;
    description = "Tran Phan Minh Tien";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      fastfetch
      git
      neovim
      kitty
      vscodium
      nodejs_20
      fish
      jetbrains.idea-community-src
      jdk21
      openjfx
      glib
      gtk3
      gdk-pixbuf
      atk
      pango
      cairo
      maven
      openjdk
      libGL
    ];
  };
  

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ ];
  environment.variables = {
  GTK_IM_MODULE = "fcitx";
  QT_IM_MODULE = "fcitx";
  XMODIFIERS = "@im=fcitx";
  INPUT_METHOD = "fcitx";
};


  services.openssh.enable = true;

  programs.the-honkers-railway-launcher.enable = true;

  system.stateVersion = "25.05";
  
}


