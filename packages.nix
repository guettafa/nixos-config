{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    vim
    unzip
    chromium
    neofetch
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
}
