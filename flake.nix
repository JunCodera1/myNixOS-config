{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
      home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, catppuccin, home-manager, zen-browser, ... } @ inputs: 
  {
   nixosConfigurations.nixchan = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };

      modules = [
      ./configuration.nix
      ./hyprland.nix
      ./fonts.nix
      catppuccin.nixosModules.catppuccin
      home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.backupFileExtension = "HMBackup";
              home-manager.useUserPackages = true;
              home-manager.users.quiet.imports = [
                ./home.nix
                catppuccin.homeManagerModules.catppuccin
              ];
              home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
            }
          ];
    };
  };
}
