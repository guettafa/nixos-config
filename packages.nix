{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    unzip
    chromium
    emacs
    neofetch
    ranger
    pipewire
    kitty
    wget
    git
    htop
    gpicview
  ];

  fonts.packages = with pkgs; [
    font-awesome
    iosevka
    nerdfonts
    terminus_font
  ];

  programs.zsh.enable = true;
}
