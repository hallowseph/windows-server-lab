# 06 — WSUS Patch Management

This section covers the setup of WSUS01 as the Contoso patch management server, including role installation, configuration, product and classification selection, sync scheduling, and GPO-based client targeting.

---

## WSUS01 — Initial Setup

### WSUS01 Static IP

WSUS01 assigned static IP `192.168.10.5`, DNS pointing to DC01.

![WSUS01 static IP](../images/06-wsus/WSUS01-static-ip.png)

### WSUS01 Ping Test

WSUS01 pinging DC01, confirming connectivity before domain join.

![WSUS01 ping DC01](../images/06-wsus/WSUS01-ping-dc01.png)

### WSUS01 Domain Join

WSUS01 joined to `TestNet.Domain`.

![WSUS01 domain join](../images/06-wsus/WSUS01-domain-join.png)

### WSUS Role Installed

Windows Server Update Services role installed on WSUS01.

![WSUS01 role installed](../images/06-wsus/WSUS01-role-installed.png)

### WSUS01 Server Manager

Server Manager on WSUS01 confirming the WSUS role is installed and running.

![WSUS01 Server Manager](../images/06-wsus/WSUS01-server-manager.png)

### WSUS Post-Install

Post-installation configuration complete — WSUS content directory and database configured.

![WSUS01 post install](../images/06-wsus/WSUS01-post-install.png)

---

## WSUS Configuration

### Update Source

WSUS configured to sync updates from Microsoft Update directly.

![WSUS01 update source](../images/06-wsus/WSUS01-update-source.png)

### Products Selected

Windows Server 2025 and Windows 11 selected as the target products for update synchronisation.

![WSUS01 products](../images/06-wsus/WSUS01-products.png)

### Classifications Selected

Update classifications configured — Critical Updates, Security Updates, and Definition Updates selected.

![WSUS01 classifications](../images/06-wsus/WSUS01-classifications.png)

### Sync Schedule

Automatic synchronisation schedule configured to keep updates current.

![WSUS01 sync schedule](../images/06-wsus/WSUS01-sync-schedule.png)

### WSUS Configured

WSUS configuration wizard completed — server ready to serve updates to domain clients.

![WSUS01 configured](../images/06-wsus/WSUS01-configured.png)

### WSUS Console

WSUS management console showing the server is online and synchronisation is active.

![WSUS01 console](../images/06-wsus/WSUS01-console.png)

---

## GPO — Client Targeting

### GPO Update Server

GPO configured to point all domain computers to `WSUS01:8530` for Windows Update.

![WSUS01 GPO update server](../images/06-wsus/WSUS01-gpo-update-server.png)

### GPO Auto Update Settings

Automatic update behaviour configured via GPO — clients set to download and notify before install.

![WSUS01 GPO auto update](../images/06-wsus/WSUS01-gpo-auto-update.png)

### GPO Client-Side Targeting

Client-side targeting enabled via GPO — computers automatically placed into target groups in the WSUS console.

![WSUS01 GPO targeting](../images/06-wsus/WSUS01-gpo-targeting.png)

---

## Summary

| Component | Detail |
|---|---|
| WSUS server | WSUS01 — 192.168.10.5 |
| Update source | Microsoft Update |
| Products | Windows Server 2025, Windows 11 |
| Client pointing | GPO → WSUS01:8530 |
| Client targeting | GPO-based, automatic group assignment |

---

[← 05 — IIS Web Server](05-iis-webserver.md) | [Next: 07 — pfSense →](07-pfsense.md)
