{ pkgs, ... }:

{
    programs = {
        adb.enable = true;
        dconf.enable = true;
        fish.enable = true;
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
                    binPath = "/etc/profiles/per-user/che/bin/mango";
                };
            };
        };
    };
}
