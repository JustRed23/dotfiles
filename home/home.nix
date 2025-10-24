{ config, pkgs, inputs, ... }:

{
    imports = [
	inputs.hyprland.homeManagerModules.default
	./programs
    ];

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
