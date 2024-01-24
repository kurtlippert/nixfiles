{
  description = "Your new nix config";

  inputs = {
    # nixpkgs
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home manager
    #home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nixvim
    # unstable channel not working for me (attow)
    #nixvim.url = "github:nix-community/nixvim";
    nixvim.url = "github:nix-community/nixvim/nixos-23.11";

    # nil (nix-lang lsp)
    nil.url = "github:oxalica/nil";

    # 
    #flakeEnv.url = "git.sr.ht:~bryan_bennett/flake_env";
    #flakeEnv.url = "https://git.sr.ht/~bryan_bennett/flake_env";
    flakeEnv.url = "git+https://git.sr.ht/~bryan_bennett/flake_env";

    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#nixl'
    nixosConfigurations = {
      nixl = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};

        # > Our main nixos configuration file <
        modules = [./configuration.nix];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#kurtl@nixl'
    homeConfigurations = {
      "kurtl@nixl" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};

        # > Our main home-manager configuration file <
        modules = [./home-manager/home.nix];
      };
    };
  };
}
