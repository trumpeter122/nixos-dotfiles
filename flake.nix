{
  description = "NixOS configuration for __SYSTEMNAME__";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      username = "__USERNAME__";
      hostname = "__SYSTEMNAME__";
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs username hostname;
        };
        modules = [
          ./hosts/__SYSTEMNAME__/configuration.nix
          home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix
        ];
      };
    };
}
