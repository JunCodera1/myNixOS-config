{ config, pkgs, ... }:

{
  fonts = {
    enableFontDir = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      ipaexfont
      vlgothic
    ];
  };

  i18n = {
    defaultLocale = "ja_JP.UTF-8";
    supportedLocales = [ "ja_JP.UTF-8" ];
  };
}

