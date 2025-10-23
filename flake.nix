{
    description = "My first ever install of nixos";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-25.05";
	home-manager = {
	    url = "github:nix-community/home-manager/release-25.05";
	    inputs.nixpkgs.follows = "nixpkgs";
	};
	hyprland.url = "github:hyprwm/Hyprland";
    };

    outputs = { nixpkgs, home-manager, hyprland, ... }@inputs:
	let
	    system = "x86_64-linux";
	    pkgs = import nixpkgs {
		inherit system;
		config = { allowUnfree = true; };
	    };
	    lib = nixpkgs.lib;
	in {
	    nixosConfigurations = {
	    	YUI = lib.nixosSystem {
		    inherit system;
		    specialArgs = { inherit inputs system; };
		    modules = [
			./system/configuration.nix
			hyprland.nixosModules.default
			{
		    	    programs.hyprland = {
				enable = true;
		    	    };
			}
			home-manager.nixosModules.home-manager
			{ 
		    	    home-manager = {
				useGlobalPkgs = true;
				useUserPackages = true;
				users.red = import ./home/home.nix;
		 		extraSpecialArgs = { inherit inputs; };
				backupFileExtension = "backup";
		    	    };
                	}	
		    ];
		};
	    };
	};
}
