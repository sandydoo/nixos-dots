{pkgs, ...}: {
  systemd.timers."mirror-update" = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnBootSec = "1h";
      OnUnitActiveSec = "1h";
      Unit = "mirror-update.service";
    };
  };

  systemd.services."mirror-update" = {
    script = ''
      ${pkgs.rsync}/bin/rsync -vPa rsync://mirrors.lug.mtu.edu/archlinux/ /var/www/mirror.zackmyers.io/archlinux/
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };

  services.nginx.virtualHosts."mirror.zackmyers.io" = {
    forceSSL = true;
    enableACME = true;
    root = "/var/www/mirror.zackmyers.io";
    locations."/".extraConfig = ''
      autoindex on;
    '';
  };
}
