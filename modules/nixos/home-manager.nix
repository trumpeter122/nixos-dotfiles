{ username, ... }:

{
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "backup";
  home-manager.extraSpecialArgs = { inherit username; };

  home-manager.users.${username} = import (../../home/users + "/${username}/default.nix");
}
