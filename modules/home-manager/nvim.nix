{
  description = "Dotfiles + Home Manager modules";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    neovim-config = {
      url = "github:Juanito87/kickstart.nvim?ref=main";
      flake = false;
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, neovim-config, ... }: {
    # This returns a NixOS module you can import in your host
    nixosModules.dotfiles = { ... }: {
      imports = [ home-manager.nixosModules.home-manager ];

      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;

      # ✅ pass extra args to all Home Manager modules (like your home.nix)
      home-manager.extraSpecialArgs = { inherit neovim-config; };

      # ✅ import as a module (no argument application here)
      home-manager.users.juanito = import ../home.nix;
    };

  };
}
