# Plex Media Server

## TODO
figure out local/public playback. this seems to be based on [Network](https://plex.jaked.in:32400/web/index.html#!/settings/server/fdc7ad4417ee3268bb58b3876db616a563fac900/settings/network)->Preferred Network Interface. best solution is likely to add a second interface for internal only traefik. clients can be seen [here](https://plex.jaked.in:32400/web/index.html#!/settings/server/fdc7ad4417ee3268bb58b3876db616a563fac900/status/server-dashboard)

### Notes

"(Plex Pass only) After the server has been set up, you should configure the LAN Networks preference to contain the network of your LAN. This instructs the Plex Media Server to treat these IP addresses as part of your LAN when applying bandwidth controls. The syntax is the same as the ALLOWED_NETWORKS below. For example 192.168.1.0/24,172.16.0.0/16 will allow access to the entire 192.168.1.x range and the 172.16.x.x range."

### Directories

    "/usr/lib/plexmediaserver"
    "/config/Library/Application Support/Plex Media Server"
    "/config/Library/Application\ Support/Plex\ Media\ Server/Logs"

### Commands

    ls /var/lib/plex/config/Library/Application\ Support/Plex\ Media\ Server/Logs/ |grep -v '[1|2|3|4|5]'

### Redeploy
- stop container
- `SERVER:$ rm /var/lib/plex/config/...`
- generate plex claim at (https://www.plex.tv/claim)
- set `$PLEX_CLAIM` to new token
- start new container
