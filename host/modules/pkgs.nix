{ pkgs, lib, ... }:

{
    environment.systemPackages = with pkgs; [
        (lib.hiPrio uutils-coreutils-noprefix)
    ];

    fonts.packages = with pkgs; [
        hackgen-nf-font
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        wqy_zenhei
    ];
}
