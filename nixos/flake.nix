{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
    
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/default/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
        # I can insert new configurations here
      };
    };
}
