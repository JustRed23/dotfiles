{ inputs, config, pkgs, ... }:

{
    users.users = {
	red = {
	    isNormalUser = true;
	    description = "JustRed23";
	    extraGroups = [
		"networkmanager"
		"wheel"
		"docker"
	    ];
	    packages = with pkgs; [];
	};
    };

    services.getty.autologinUser = "red";
}
