{ username, ... }:

{
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "backup";

  home-manager.users.${username} = import ../../home/users/__USERNAME__/default.nix;
}
