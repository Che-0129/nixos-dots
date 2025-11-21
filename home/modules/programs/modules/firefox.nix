{ config, pkgs, ... }:

{
    programs.firefox = {
        enable = true;
        languagePacks = [ "ja" ];
        profile.che = {
            bookmarks = {};
            settings = {
                "sidebar.verticalTabs" = true;
            };
        };
    };
}
