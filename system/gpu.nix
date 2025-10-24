{ inputs, config, pkgs, ... }:

{
    hardware.graphics = {
    	enable = true;
	enable32Bit = true;
    };

    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
	package = config.boot.kernelPackages.nvidiaPackages.stable;
	modesetting.enable = true;
	powerManagement = {
	    enable = false;
	    finegrained = false;
	};
	open = false;
	nvidiaSettings = true;
    };

    environment.systemPackages = with pkgs; [
  	nvtopPackages.full
    ];    
}
