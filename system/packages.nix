{ inputs, config, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
	# System Essentials
	fastfetch # flexing is an essential thing
	btop
	kdePackages.dolphin
	kdePackages.partitionmanager
	
	# Editors
	neovim
	libreoffice

	# Development
	docker
	docker-compose
	git
	
	# Games
	heroic
    ];

    fonts.packages = with pkgs; [
	font-awesome
    ];
}
