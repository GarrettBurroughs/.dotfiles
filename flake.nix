{
  description = "gburroughs development flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ... }: 
  let
    mkHome = username: homeDirectory: home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux; # Adjust system if needed
      modules = [
        ./home.nix 
        {
          home.username = username;
          home.homeDirectory = homeDirectory;
        }
      ];
    };
  in {
    homeConfigurations = {
      "codespace" = mkHome "codespace" "/home/codespace";
      "gburroughs" = mkHome "gburroughs" "/home/gburroughs"; 
    };
  };
}
