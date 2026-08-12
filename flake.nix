{
description = "NixOS Flake";
inputs = {
  nixpkgs.url = "nixpkgs/nixos-26.05";
  home-manager = {
    url = "github:nix-community/home-manager/release-26.05";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  nixos-wsl.url = "github:nix-community/NixOS-WSL";
  nixvim = {
	url = "github:nix-community/nixvim/nixos-26.05";
  };
  zen-browser = {
	url = "github:youwen5/zen-browser-flake";
	inputs.nixpkgs.follows = "nixpkgs";
  };
};

outputs = { self, nixpkgs, home-manager, nixos-wsl, nixvim, zen-browser, ... }: {
  nixosConfigurations.wsl-laptop = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	specialArgs = {
	  inherit self;
	};
	modules = [
	  ./hosts/wsl-laptop/default.nix
	  nixos-wsl.nixosModules.default
	  home-manager.nixosModules.home-manager {
		home-manager.useGlobalPkgs = true;
		home-manager.useUserPackages = true;
		home-manager.sharedModules = [
		  nixvim.homeManagerModules.nixvim
		];
	  }
    ];
  };
  nixosConfigurations.nixos-laptop = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	specialArgs = {
	  inherit self;
	};
	modules = [
	  ./hosts/nixos-laptop/default.nix
	  home-manager.nixosModules.home-manager {
		home-manager.useGlobalPkgs = true;
		home-manager.useUserPackages = true;
		home-manager.sharedModules = [
		  nixvim.homeManagerModules.nixvim
		];
	  }
    ];
  };
};

}
