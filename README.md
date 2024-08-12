# Tailscale Exit Node

This repository contains a few utilities to bring up a Tailscale exit node quickly and easily using docker and docker-compose on almost any Linux machine.

## Requirements

- docker
- docker-compose

## Usage

1. Clone this repository
2. Edit the `auth.key` file with your Tailscale auth key. To make a new auth key, go [here](https://login.tailscale.com/admin/settings/keys).
3. Run `docker-compose up`
4. Wait for the Tailscale service to start
5. Visit [https://login.tailscale.com/admin/machines](https://login.tailscale.com/admin/machines) to approve the machine's status as an exit node (should be named exit-node, click on the "...", then "Edit route settings" then click "Use as exit node")
6. Optionally, disable key expiry by clicking on the "..." again and then "Disable key expiry"
7. Once you've made sure everything is working, you can stop the container by doing Ctrl+C and then `docker-compose down`
8. Run it in a detached manner by doing `docker-compose up -d` and don't worry about it anymore :)

## Notes

- You can delete the `auth.key` file after you've made sure everything is working.
- Do not delete the `config/` directory, it contains the Tailscale configuration files.
- If you want to change the Tailscale hostname, you can do so by editing the `config.sh` file or just changing it on the [tailscale admin panel](https://login.tailscale.com/admin/machines).
