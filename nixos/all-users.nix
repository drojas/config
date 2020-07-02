{ config, pkgs, lib, ... }:

let
  username = "david";
in {
  users.extraUsers."${username}" = {
    uid = 1000;
    isNormalUser = true;
    name = username;
    group = username;
    extraGroups = [
      "wheel" "disk" "audio" "video"
      "network-manager" "systemd-journal"
      "docker"
      "kubernetes"
    ];
    createHome = true;
    home = "/home/${username}";
    openssh.authorizedKeys.keys = [
    ];
    packages = with pkgs; [
    ];
  };

  users.extraGroups.${username} = {
    gid = 1000;
  };
}
