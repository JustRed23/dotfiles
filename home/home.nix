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
	userName = "JustRed23";
	userEmail = "manuel.bormans@gmail.com";
    };

    home.packages = with pkgs; [
	spotify
	#jetbrains-toolbox #seems to be broken currently
	discord
	steam
    ];

    programs.home-manager.enable = true;
}
