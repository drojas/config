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
      "networkmanager" "systemd-journal"
      "docker"
      "kubernetes"
    ];
    createHome = true;
    home = "/home/${username}";
    openssh.authorizedKeys.keys = [
    ];
    packages = with pkgs; [
    ];
    hashedPassword = "$6$qIaDNdNn$ItbYPCv5RnfBG4UKP/ySb1e16TW9URoKQ.XjKfwxvisdZXtt7AgS5waXf/1lW4vvBv016X0R8UprzUBbHuffN0";
  };

  users.extraGroups.${username} = {
    gid = 1000;
  };
}
