{ config, pkgs, ... }:

{
    programs.firefox = {
        enable = true;
        languagePacks = [ "ja" ];
        profiles.che = {
            bookmarks = {};
            settings = {
                "sidebar.verticalTabs" = true;
                "browser.tabs.closeWindowWithLastTab" = false;
                "ui.key.menuAccessKeyFocuses" = false;
            };
        };
        policies.RequestedLocales = [ "ja" ];
    };
}
