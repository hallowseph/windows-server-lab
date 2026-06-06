# 05 — IIS Web Server (WEB01)

## Server Details
- Hostname: WEB01
- IP Address: 192.168.10.4
- OS: Windows Server 2025 Standard
- Role: IIS Web Server, Contoso Intranet
- Domain: TestNet.Domain

## Roles Installed
- Web Server (IIS)
- IIS Management Console
- IIS Management Tools

## Intranet Site Configuration
| Setting | Value |
|---|---|
| Site Name | Contoso-Intranet |
| Physical Path | C:\inetpub\intranet |
| HTTP Binding | Port 80, intranet.testnet.domain |
| HTTPS Binding | Port 443, intranet.testnet.domain |
| SSL Certificate | Self-signed, 2 year validity |

## DNS Record
- Added A record on DC01: intranet → 192.168.10.4
- Accessible via: http://intranet.testnet.domain
- Accessible via: https://intranet.testnet.domain

## SSL Certificate
- Type: Self-signed
- DNS Name: intranet.testnet.domain
- Friendly Name: Contoso Intranet SSL
- Validity: 2 years
- Store: LocalMachine\My
- Note: Browser shows "Not secure" warning — expected behaviour
  for self-signed certificates not issued by a trusted CA.
  In production, a CA-issued certificate would be used instead.

## Troubleshooting Notes
- ERR_CERT_AUTHORITY_INVALID is expected with self-signed certs
- Click Advanced → Proceed to bypass browser warning in lab
- In production: use Let's Encrypt or internal PKI CA certificate

## Commands Used
```powershell
# Create intranet directory
New-Item -Path "C:\inetpub\intranet" -ItemType Directory -Force

# Create IIS website
New-WebSite -Name "Contoso-Intranet" -Port 80 `
    -PhysicalPath "C:\inetpub\intranet" `
    -HostHeader "intranet.testnet.domain" -Force

# Create self-signed SSL certificate
$cert = New-SelfSignedCertificate `
    -DnsName "intranet.testnet.domain" `
    -CertStoreLocation "cert:\LocalMachine\My" `
    -FriendlyName "Contoso Intranet SSL" `
    -NotAfter (Get-Date).AddYears(2)

# Add HTTPS binding
New-WebBinding -Name "Contoso-Intranet" `
    -Protocol "https" -Port 443 `
    -HostHeader "intranet.testnet.domain"

# Add DNS record on DC01
Add-DnsServerResourceRecordA `
    -Name "intranet" `
    -ZoneName "TestNet.Domain" `
    -IPv4Address "192.168.10.4"
```

## Screenshots
![IIS Installed](../images/windows-server-lab/05-iis-webserver/WEB01-iis-installed.png)
![IIS Manager](../images/windows-server-lab/05-iis-webserver/WEB01-iis-manager.png)
![Default IIS Site](../images/windows-server-lab/05-iis-webserver/WEB01-default-site.png)
![IIS Site Created](../images/windows-server-lab/05-iis-webserver/WEB01-iis-site-created.png)
![DNS Record Added](../images/windows-server-lab/05-iis-webserver/WEB01-dns-record.png)
![Intranet HTTP](../images/windows-server-lab/05-iis-webserver/WEB01-intranet-site.png)
![SSL Certificate](../images/windows-server-lab/05-iis-webserver/WEB01-ssl-cert.png)
![SSL Warning](../images/windows-server-lab/05-iis-webserver/WEB01-ssl-warning.png)
![Intranet HTTPS](../images/windows-server-lab/05-iis-webserver/WEB01-https-site.png)