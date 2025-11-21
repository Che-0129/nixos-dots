{ config, pkgs, ...}:

{
    imports = [
        ./modules/gtk.nix
        ./modules/inputMethod.nix
        ./modules/mango.nix
        ./modules/pkgs.nix
        ./modules/programs/programs.nix
        ./modules/services/services.nix
    ];

    home = {
        username = "che";
        homeDirectory = "/home/che";
        stateVersion = "25.11";
        language = {
            adress = "ja-JP.utf8";
            base = "ja-JP.utf8";
            collate = "ja-JP.utf8";
            ctype = "ja-JP.utf8";
            measurement = "ja-JP.utf8";
            messages = "ja-JP.utf8";
            monetary = "ja-JP.utf8";
            name = "ja-JP.utf8";
            numeric = "ja-JP.utf8";
            paper = "ja-JP.utf8";
            telephone = "ja-JP.utf8";
            time = "ja-JP.utf8";
        };
        file = {
            ".config/libfm".source = ./configs/libfm;
            ".config/mozc/config1.db".source = ./configs/mozc/config1.db;
            ".config/pcmanfm".source = ./configs/pcmanfm;
            ".config/xarchiver".source = ./configs/xarchiver;
        };
    };

    xdg.userDirs = {
        enable = true;
        createDirectories = true;
    };
}
