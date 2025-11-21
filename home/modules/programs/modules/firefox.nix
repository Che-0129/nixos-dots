{ config, pkgs, ... }:

{
    programs.firefox = {
        enable = true;
        languagePacks = [ "ja" ];
        profiles.che = {
            settings = {
                "browser.tabs.closeWindowWithLastTab" = false;
                "font.name.sans-serif.ja" = "Noto Sans CJK JP";
                "sidebar.verticalTabs" = true;
                "ui.key.menuAccessKeyFocuses" = false;
            };
        };
        policies.RequestedLocales = [ "ja" ];
    };
}
