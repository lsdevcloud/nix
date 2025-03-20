{ config, pkgs, ... }:

{
    services.nginx = {
        enable = true;
        virtualHosts."lsdevcloud.net" = {
            root = "/var/www/lsdevcloud.net";
            serverName = "lsdevcloud.net";
            enableACME = true;
            email = "admin@lsdevcloud.net";
            forceSSL = true;
        };
    };

    # install packages
    environment.systemPackages = with pkgs; [
        neofetch
        temurin-jre-bin-17
        docker
        docker-compose
        certbot
    ];

    # generate ssl certificates
    security.acme = {
        enable = true;
        certs."lsdevcloud.net" = {
            email = "abuse@lsdevcloud.net";
            webroot = "/var/www/lsdevcloud.net"; 
        };
    };

    # set system version
    system.stateVersion = "24.11";
}

