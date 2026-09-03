{ inputs, pkgs, ... }: {
    home.packages = with pkgs; [
        android-tools
        aria2
        bat
        blender
        brightnessctl
        discord
        dos2unix
        git
        grim
        jujutsu
        kicad
        p7zip
        payload-dumper-go
        picotool
        qmk
        inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.qwen-code
        slurp
        telegram-desktop
        trash-cli
        unzip
        vlc
        wl-clipboard
        zip
    ];
}
