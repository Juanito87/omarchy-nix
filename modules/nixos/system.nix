{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.omarchy;
  packages = import ../packages.nix {inherit pkgs lib; exclude_packages = cfg.exclude_packages;};
in {
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Initial login experience
  services.greetd = {
    enable = true;
    settings.default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
  };

  # Install packages
  environment.systemPackages = packages.systemPackages;
  programs.direnv.enable = true;

  # Networking
  services.resolved.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  networking = {
    networkmanager.enable = true;
  };

  # Enable the Tailscale service
  services.tailscale.enable = true;
  # (Optional) If you want to use routing features like subnet routers or exit nodes
  services.tailscale.useRoutingFeatures = "both"; # or "client", "server", "none"

  networking.wg-quick.interfaces.wg0.configFile = "/etc/nixos/files/wireguard/edu.conf";
  # {
  # fonts.packages = with pkgs; [
  #     nerd-fonts.agave
  #     nerd-fonts.fira-mono
  #     font-awesome
  #     noto-fonts
  #     noto-fonts-emoji
  #     noto-fonts-cjk-sans
  #     powerline-fonts
  #     powerline-symbols
  #     ];
  #   fontconfig = {
  #     defaultFonts = {
  #       monospace = [ "FiraMono Nerd Font Mono"  ];
  #       };
  #     };
  # };
}
