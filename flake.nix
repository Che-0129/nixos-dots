{
    description = "NixOS + MangoWC";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        flake-parts.url = "github:hercules-ci/flake-parts";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        mango = {
            url = "github:DreamMaoMao/mangowc";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        modes-nvim = {
            url = "github:mvllow/modes.nvim";
            flake = false;
        };
    };

    outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    {
        nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./host/configuration.nix
                inputs.home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        backupFileExtension = "hm-backup";
                        extraSpecialArgs = { inherit inputs; };
                        users.che = ./home/home-manager.nix;
                    };
                }
            ];
        };
    };
}
