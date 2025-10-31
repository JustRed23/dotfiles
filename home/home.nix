{ config, pkgs, inputs, ... }:

{
    imports = [
	./programs
    ];

    # Fix weird cursors on non-wayland apps
    home.file.".local/share/icons/default" = {
  	source = "${pkgs.kdePackages.breeze}/share/icons/breeze_cursors/";
  	recursive = true;
    };

    home.username = "red";
    home.homeDirectory = "/home/red";
    home.stateVersion = "25.05";

    programs.firefox.enable = true;
    programs.kitty.enable = true;

    programs.bash = {
	enable = true;
	shellAliases = {
	};
    };

    programs.git = {
	enable = true;
	settings.user = {
	    name = "JustRed23";
	    email = "manuel.bormans@gmail.com";
	};
    };

    services.easyeffects.enable = true;

    home.packages = with pkgs; [
	spotify
	#jetbrains-toolbox #seems to be broken currently
	discord
	steam
    ];

    programs.home-manager.enable = true;
}
