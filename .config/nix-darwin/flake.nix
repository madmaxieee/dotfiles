{
  description = "My Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    # home-manager.url = "github:nix-community/home-manager";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core
    , homebrew-cask }:
    let
      configuration = { pkgs, ... }: {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget
        environment.systemPackages = [
          pkgs.neovim
          pkgs.vim
          pkgs.fish
          pkgs.tmux
          pkgs.git
          pkgs.zig
          pkgs.sesh
          pkgs.atuin
          pkgs.fzf
          pkgs.jq

          pkgs.luajitPackages.luv
          pkgs.luajitPackages.sqlite

          pkgs.micromamba
          pkgs.stow

          pkgs.kitty

          pkgs.nixfmt-classic
        ];

        homebrew = {
          enable = true;
          brews = [ "coreutils" "findutils" "imagemagick" ];
          casks = [ "hammerspoon" ];
          onActivation = {
            autoUpdate = true;
            cleanup = "zap";
            upgrade = true;
            extraFlags = [ "--verbose" "--debug" ];
          };
        };

        environment.variables = { EDITOR = "nvim"; };

        # Auto upgrade nix package and the daemon service.
        services.nix-daemon.enable = true;
        # nix.package = pkgs.nix;
        services.yabai = {
          enable = true;
          package = pkgs.yabai;
          enableScriptingAddition = true;
        };
        services.skhd = {
          enable = true;
          package = pkgs.skhd;
        };
        services.jankyborders = {
          enable = true;
          package = pkgs.jankyborders;
          active_color = "0xaae1e3e4";
          inactive_color = "0x00494d64";
          width = 3.0;
        };

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        programs.fish.enable = true;

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 4;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";

        security.pam.enableSudoTouchIdAuth = true;

        system.defaults = {
          finder.AppleShowAllExtensions = true;
          finder.AppleShowAllFiles = true;
        };
      };
    in {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#madmax-mbp
      darwinConfigurations."madmax-mbp" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          inputs.nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
              enableRosetta = true;

              # User owning the Homebrew prefix
              user = "madmax";

              # Optional: Declarative tap management
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
              };

              autoMigrate = true;
            };
          }
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."madmax-mbp".pkgs;
    };
}
