{ pkgs, ... }:

{
    boot = {
        consoleLogLevel = 3;
        initrd.systemd.enable = true;
        kernelPackages = pkgs.linuxPackages_latest;
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
    };

    fileSystems."/".options = [ "compress=zstd:1" "noatime" "space_cache=v2" ];

    zramSwap = {
        enable = true;
        memoryPercent = 50;
    };

    swapDevices = [{
        device = "/swapfile";
        size = 4096;
    }];

    networking = {
        hostName = "NixOS";
        networkmanager.enable = true;
    };
}
