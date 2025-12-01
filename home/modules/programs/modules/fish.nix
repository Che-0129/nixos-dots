{ ... }:

{
    programs.fish = {
        enable = true;
        loginShellInit = ''
            if uwsm check may-start
                exec uwsm start mango-uwsm.desktop
            end
        '';
        shellAbbrs = {
            dl = "cd ~/Downloads";
            rb = "systemctl reboot";
            sd = "systemctl poweroff";
            rm = "trash-put";
            ls = "eza --icons";
            la = "eza --icons -a";
            ll = "eza --icons -l";
            less = "bat --theme Nord -p";
            cat = "bat --theme Nord -pp";
            c = "clear";
            cls = "clear && ls";
        };
    };
}
