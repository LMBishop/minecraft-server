Basic configuration files for my Minecraft server.

At time of writing, the following services are defined:

* `creative` - a creative Paper server
* `survival` - a survival Paper server
* `proxy` - a Velocity server
* `nginx` - reverse proxy for dynmap running on `creative` and `survival`
* `mariadb` - database for all Minecraft servers

## Instructions

1. Clone this repository
2. Copy `.env-default` to `.env`
3. Modify the values in `.env`
4. Review `docker-compose.yml`
	* Add/remove servers you want/don't want
	* Change versions to appropiate versions (e.g. 1.19 for Paper)
	* Ensure specified Paper and Velocity versions are also defined in `.env`, space-seperated
5. Run `make build`
6. Run `make start`
7. Configure everything

Minecraft data will be stored in `data/`. `make build` builds the latest Paper and Velocity versions for the specified Minecraft version.
