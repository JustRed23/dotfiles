{ inputs, config, pkgs, ... }:

{
    hardware.graphics = {
    	enable = true;
    };

    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
	package = config.boot.kernelPackages.nvidiaPackages.stable;
	modesetting.enable = true;
	powerManagement = {
	    enable = true;
	};
	open = true;
    };

    environment.systemPackages = with pkgs; [
  	nvtopPackages.full
    ];    
}
