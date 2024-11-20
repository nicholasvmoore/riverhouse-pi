# Restart Modem

This python script will query ubus on openwrt and if it detects the network is down it will retart the networking service.

## Dependencies

Install these dependencies on your OpenWRT router

```bash
opkg install python3-ubus
```