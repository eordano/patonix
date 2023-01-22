{
  description = "Pato Boot";
  inputs.nixos.url = "github:nixos/nixpkgs/nixos-22.11";
  outputs = { self, nixos }: {

    nixosConfigurations = let
      # Shared base configuration.
      baseSystem = {
        system = "x86_64-linux";

        modules = [
          ./ssh.nix
        ];
      };
    in {
      patoIso = nixos.lib.nixosSystem {
        inherit (baseSystem) system;
        modules = baseSystem.modules ++ [
          "${nixos}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
        ];
      };
      base = nixos.lib.nixosSystem {
        inherit (baseSystem) system;
        modules = baseSystem.modules ++ [
        ];
      };
    };
  };
}
