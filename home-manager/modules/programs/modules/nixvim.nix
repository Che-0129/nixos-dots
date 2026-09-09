{ config, inputs, pkgs, ... }: {
    imports = [ inputs.nixvim.homeModules.nixvim ];
    programs.nixvim = {
        enable = true;
        extraPlugins = [
            pkgs.vimPlugins.onenord-nvim
            (pkgs.vimUtils.buildVimPlugin {
                pname = "blink-lib";
                version = "0-unstable-2026-09-01";
                src = pkgs.fetchFromGitHub {
                    owner = "saghen";
                    repo = "blink.lib";
                    rev = "fd9a48ebbe6ec30d5dfcc5b42c243941ccdca1aa";
                    hash = "sha256-CyDv8bRHjGKpn/qDMaplDBcqwQl73ZPkhjmvzkizF/I=";
                };
            })
        ];
        defaultEditor = true;
        nixpkgs.config.allowUnfree = true;
        nixpkgs.source = pkgs.path;
        opts = {
            autoindent = true;
            autoread = true;
            clipboard = "unnamedplus";
            expandtab = true;
            guicursor = "i:ver100-blinkon500-blinkoff500";
            hlsearch = false;
            incsearch = true;
            mouse = "";
            number = true;
            scrolloff = 5;
            shiftwidth = 4;
            sidescrolloff = 5;
            swapfile = false;
            tabstop = 4;
            termguicolors = true;
            title = true;
        };
        extraConfigLua = ''
            require("onenord").setup({
                disable = {
                    background = true
                }
            })
        '';
        autoCmd = [{
            event = [ "InsertLeave" "CmdlineLeave" ];
            callback.__raw = ''
                function()
                    vim.system({ "fcitx5-remote", "-c" }, { detach = true })
                end
            '';
        }];
        diagnostic.settings = {
            virtual_text = true;
            underline = true;
        };
        keymaps = [
            {
                action = "gj";
                key = "j";
                mode = "n";
            }
            {
                action = "gk";
                key = "k";
                mode = "n";
            }
        ];
        plugins = {
            blink-cmp = {
                enable = true;
                settings = {
                    completion = {
                        documentation = {
                            auto_show = true;
                            window.border = "rounded";
                        };
                        menu.border = "rounded";
                    };
                    keymap.preset = "enter";
                    sources.default = [
                        "lsp"
                        "path"
                        "buffer"
                    ];
                };
            };
            blink-indent.enable = true;
            blink-pairs.enable = true;
            colorizer.enable = true;
            lsp = {
                enable = true;
                servers = {
                    clangd.enable = true;
                    cssls.enable = true;
                    html.enable = true;
                    jsonls.enable = true;
                    nixd.enable = true;
                    pyright.enable = true;
                };
            };
            lualine.enable = true;
            modicator.enable = true;
            neoscroll.enable = true;
            treesitter = {
                enable = true;
                grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
                    c
                    cpp
                    css
                    html
                    json
                    lua
                    nix
                    python
                ];
                highlight.enable = true;
                indent.enable = true;
            };
            whitespace.enable = true;
        };
    };
}
