{ config, pkgs, ...}

{
    # enable nginx
    services.nginx.enable = true;

    # install neofetch
    environment.systemPackages = with pkgs; [
        neofetch
        temurin-jre-bin-17
        docker 
        docker-compose
    ];

    # set version
    system.stateVersion = "24.11";
}

