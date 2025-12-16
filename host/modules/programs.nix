{ pkgs, ... }:

{
    programs = {
        dconf.enable = true;
        fish.enable = true;
        nh = {
            enable = true;
            clean = {
                enable = true;
                extraArgs = "--keep-since 7d --keep 3";
            };
            flake = "~/.nixos-dots";
        };
        steam = {
            enable = true;
            extraCompatPackages = [ pkgs.proton-ge-bin ];
        };
        uwsm = {
            enable = true;
            waylandCompositors = {
                mango = {
                    prettyName = "Mango";
                    comment = "Mango managed by UWSM";
                    binPath = "/run/current-system/sw/bin/mango";
                };
            };
        };
    };
}
