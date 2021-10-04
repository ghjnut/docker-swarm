## NOTES
### SSL termnation with traefik
(https://community.ui.com/questions/Need-to-disable-HTTPS-for-Web-interface-on-Unifi-Controller/aab7d2d7-7ae6-4300-9fcb-4d685359176c#answer/cbfc9b0e-52ab-4d4a-830e-05ce587c1d1f)

disable https redirect

(/usr/lib/unifi/data/system.properties:)

    unifi.https.redirect=false

enable unifi core

(/etc/default/unifi:)

    UNIFI_CORE_ENABLED=true

The controller will be available on http://127.0.0.1:8081

## PORTS

    UDP 	3478 	Port used for STUN.
    UDP 	5514 	Port used for remote syslog capture.
    TCP 	8080 	Port used for device and application communication.
    TCP 	8443 	Port used for application GUI/API as seen in a web browser.
    TCP 	8880 	Port used for HTTP portal redirection.
    TCP 	8843 	Port used for HTTPS portal redirection.
    TCP 	6789 	Port used for UniFi mobile speed test.
    TCP 	27117 	Port used for local-bound database communication.
    UDP 	5656-5699 	Ports used by AP-EDU broadcasting.
    UDP 	10001 	Port used for device discovery.
    UDP 	1900 	Port used for "Make application discoverable on L2 network" in the UniFi Network settings.
