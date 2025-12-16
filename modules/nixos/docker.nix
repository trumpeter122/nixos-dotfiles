{ pkgs, username, ... }:

{
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    docker
    docker-compose
  ];

  users.users.${username}.extraGroups = [ "docker" ];
}
