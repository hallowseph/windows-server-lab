# 05 — IIS Web Server

This section covers the setup of WEB01 as the Contoso intranet web server, including IIS installation, custom site creation, DNS A record, SSL certificate, and HTTPS binding.

---

## WEB01 — Initial Setup

### WEB01 Rename

WEB01 renamed before domain join to match Contoso naming convention.

![WEB01 rename](../images/05-iis/WEB01-rename.png)

### WEB01 Static IP

WEB01 assigned static IP `192.168.10.4`, DNS pointing to DC01.

![WEB01 static IP](../images/05-iis/WEB01-static-ip.png)

### WEB01 Ping Test

WEB01 pinging DC01 at `192.168.10.1`, confirming connectivity before domain join.

![WEB01 ping DC01](../images/05-iis/WEB01-ping-dc01.png)

### WEB01 Domain Join

WEB01 joined to `TestNet.Domain`.

![WEB01 domain join](../images/05-iis/WEB01-domain-join.png)

### IIS Installed

IIS role installed on WEB01 via Server Manager.

![WEB01 IIS installed](../images/05-iis/WEB01-iis-installed.png)

### WEB01 Server Manager

Server Manager on WEB01 confirming the Web Server (IIS) role is installed and running.

![WEB01 Server Manager](../images/05-iis/WEB01-server-manager.png)

---

## IIS Configuration

### IIS Manager

IIS Manager open on WEB01 showing the default site and the Contoso intranet site listed.

![WEB01 IIS Manager](../images/05-iis/WEB01-iis-manager.png)

### Default Site

IIS default site visible before the custom Contoso site was created.

![WEB01 default site](../images/05-iis/WEB01-default-site.png)

### Intranet Site Created

Custom Contoso intranet site created in IIS with the correct physical path and hostname binding.

![WEB01 IIS site created](../images/05-iis/WEB01-iis-site-created.png)

---

## DNS Record

### DNS A Record

DNS A record created on DC01 pointing `intranet.testnet.domain` to WEB01 at `192.168.10.4`.

![WEB01 DNS record](../images/05-iis/WEB01-dns-record.png)

---

## SSL Certificate & HTTPS

### SSL Certificate

Self-signed SSL certificate created on WEB01 and bound to the intranet site for HTTPS access.

![WEB01 SSL cert](../images/05-iis/WEB01-ssl-cert.png)

### SSL Warning

Browser SSL warning displayed when accessing the site via HTTPS — expected behaviour for a self-signed certificate in a lab environment.

![WEB01 SSL warning](../images/05-iis/WEB01-ssl-warning.png)

### Intranet Site — HTTP

Custom Contoso intranet homepage loading over HTTP via `intranet.testnet.domain`.

![WEB01 intranet site](../images/05-iis/WEB01-intranet-site.png)

### Intranet Site — HTTPS

Contoso intranet homepage loading over HTTPS, confirming SSL binding is working.

![WEB01 HTTPS site](../images/05-iis/WEB01-https-site.png)

---

## Summary

| Component | Detail |
|---|---|
| IIS site | Contoso intranet |
| DNS record | intranet.testnet.domain → 192.168.10.4 |
| HTTP binding | Port 80 |
| HTTPS binding | Port 443 with self-signed SSL |

---

[← 04 — File Server](04-file-server.md) | [Next: 06 — WSUS →](06-wsus.md)
