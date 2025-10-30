{ inputs, config, pkgs, ... }:

{
    environment = {
	variables = {
	    EDITOR = "nvim";
	};
	sessionVariables = {
	    # Hint Electron apps to use wayland
	    NIXOS_OZONE_WL = "1";
	};
    };

    security.rtkit.enable = true;

    services = {
	# Touchpad
	libinput.enable = true;
	
	pipewire = {
	    enable = true;
	    alsa.enable = true;
	    alsa.support32Bit = true;
	    pulse.enable = true;
	    extraConfig.pipewire."92-low-latency" = {
      		"context.properties" = {
        	    "default.clock.rate" = 48000;
        	    "default.clock.quantum" = 512;
        	    "default.clock.min-quantum" = 512;
        	    "default.clock.max-quantum" = 2048;
        	};
     	    };
	};

	pulseaudio.enable = false;

	printing.enable = true;
    };

    # Language
    i18n.defaultLocale = "en_US.UTF-8";

    # Date/Time
    time.timeZone = "Europe/Brussels";

    # Boot Options
    boot.loader = {
	systemd-boot.enable = true;
	efi.canTouchEfiVariables = true;
    };

    # Other
    virtualisation.docker.enable = true;
    documentation.dev.enable = true;
    
    nix.gc = {
	automatic = true;
	dates = "weekly";
	options = "--delete-older-than 7d";
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
