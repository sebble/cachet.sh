# CachetHQ Shell Monitor

The `cachet.sh` shell script in this repo provides simple commands to initialise and update a [Cachet](https://cachethq.io/) installation.

Also included is a `docker-compose.yml` file which will set up an Alpine based image running cron to maintain your Cachet monitoring.

## Installation
   
### Dangerous one-liner
   
    wget -O- https://raw.githubusercontent.com/sebble/cachet-shell-monitor/master/cachet.sh \
    | sudo tee /usr/local/bin/cachet && sudo chmod +x /usr/local/bin/cachet

### From this repository

    git clone https://github.com/sebble/cachet-shell-monitor.git
    cd cachet-shell-monitor
    sudo ./cachet.sh --install

### Manually

    wget -O https://raw.githubusercontent.com/sebble/cachet-shell-monitor/master/cachet.sh
    sudo cp cachet.sh /usr/local/bin/cachet
    sudo chmod +x /usr/local/bin/cachet

### As a Docker container [**recommended**]

**Notice: image not built yet**

    docker run \
        --restart always \
        -e "CACHET_API=https://status.example.com/api/v1" \
        -e "CACHET_TOKEN=<your_cachet_api_token_here>" \
        sebble/cachet-shell-monitor

### As a Docker container (with Docker Compose)

    wget -O https://raw.githubusercontent.com/sebble/cachet-shell-monitor/master/docker-compose.yml
    docker-compose up -d


## Usage

See `cachet --help` and `cachet <action> --help` for more examples.

    sudo /usr/local/bin/cachet --install /usr/local/bin
    export CACHET_API=https://status.example.com/api/v1
    export CACHET_TOKEN=8sjn12390vg34ma02nd
    vi config.d/example.conf
    cachet init config.d
    cachet crontab config.d | crontab -u cachet-shell-monitor -
    cachet update-component 1 2
    curl -s https://status.example.com/api/v1/components/1 | jq .

See also: https://stedolan.github.io/jq/
