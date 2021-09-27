# Pi-hole
https://pi-hole.net/

## WARNING
doing a docker stack deploy will have issues when trying to update this image. CARE.

## Blocklists
[Developer Dan](https://www.github.developerdan.com/hosts/)
[Wally3k Firebog](https://firebog.net/)

pushd stacks/pihole
docker stack deploy --resolve-image never -c <(docker-compose -f docker-stack.yml config) --prune pihole
popd
