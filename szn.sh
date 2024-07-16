#!/bin/bash

# Hỏi thông tin cho Trojan
read -p "Nhập NodeID cho Trojan: " trojan_node_id
read -p "Nhập domain cho Trojan: " trojan_domain

# Hỏi thông tin cho V2Ray
read -p "Nhập NodeID cho V2Ray: " v2ray_node_id

# Cài đặt XrayR
wget -N https://raw.githubusercontent.com/XrayR-project/XrayR-release/master/install.sh && bash install.sh
echo "da cai xong XrayR"

# Mở các cổng 443 và 80
ufw allow 443
ufw allow 80
ufw disable
echo "mo xong thanh cong"
# Tạo certificate và private key
cat << EOF > /root/szn.cert
-----BEGIN CERTIFICATE-----
MIIEFTCCAv2gAwIBAgIUNghaEyVV3RhRHV7vs4IId/pcaYEwDQYJKoZIhvcNAQEL
BQAwgagxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQH
Ew1TYW4gRnJhbmNpc2NvMRkwFwYDVQQKExBDbG91ZGZsYXJlLCBJbmMuMRswGQYD
VQQLExJ3d3cuY2xvdWRmbGFyZS5jb20xNDAyBgNVBAMTK01hbmFnZWQgQ0EgNGE3
ZDc0NjJmN2FiNWEyNWU1ZjE0ZjZmMzJkYmE3YmEwHhcNMjQwNTA3MDYwODAwWhcN
MzQwNTA1MDYwODAwWjAiMQswCQYDVQQGEwJVUzETMBEGA1UEAxMKQ2xvdWRmbGFy
ZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALojQRgnTfGXkOxJRuNU
T9P/wBd88LzWVPF3Un70wz8Tq2Y1rUgppVD3PaVtqxTC8xAXBy4bafhZqPMt/GD7
WTH3ZU5VNHq80FusNH52KQWgrhLKN5ZddCHvU8AK85ARYMzrNtiMtMlBsyT/isKI
wGv7KkkBLfMKGivqZpe9CNV9dAw0FKGA1QBcM3zGMNrRCHbQdhPQe7SLSHupNqQG
1Yl1ri10EV1nOj0Nku7Pdx7moNuCpOzo+VkecKB8+g4EbjQicto3Z/sG8zrsgUnM
qElzhXVfcJO/gDJ1GNLpqYp6Ihm6Hq9dgS58pKsHCkB/pd7VbxxjTwxArkIbDklO
3nUCAwEAAaOBuzCBuDATBgNVHSUEDDAKBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAA
MB0GA1UdDgQWBBS5htKK/zpZHKWKzLP95et4h8HfyjAfBgNVHSMEGDAWgBS+14BX
0sVgazSCuW0WxZreBXD2PTBTBgNVHR8ETDBKMEigRqBEhkJodHRwOi8vY3JsLmNs
b3VkZmxhcmUuY29tL2NlZWNkMzU5LTkzZWMtNGNjMS04NGMwLWIyMzFjYTk4NTZj
Zi5jcmwwDQYJKoZIhvcNAQELBQADggEBAHib/LUh43GEAJU0Ebg4fk5vDSN31881
vge6Ak58Iik08JaO8v/TEJayOYZDPvEiP3G3FTIKQYcUQDXY2wGEfHH+1z0FqjOS
0FxwUXsQctfKhHCKbt1GR7Q88LNwgRwVANxaKEmcr5G8rU7uNLrV6SKOpGd772HX
tBZUDvoar5XJfUDMhkYro4tH7HtULlsbG8DgWR59Kx2KJDbGiaEe1jq4UxjGxfZc
/q6q1f+6Ac9iFnbBhGUQX3mmaW7sDvkJEU3nuAImp5otl2YVCJ8MAsAN1No/j+66
u6KtYy7Egn10uMW3/DrCFsjz41vnT+kW/sCDqmRW5ijmDt/Jy2PQ8io=
-----END CERTIFICATE-----

EOF
echo "da tao xong szn.cert "
cat << EOF > /root/szn.key
-----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC6I0EYJ03xl5Ds
SUbjVE/T/8AXfPC81lTxd1J+9MM/E6tmNa1IKaVQ9z2lbasUwvMQFwcuG2n4Wajz
Lfxg+1kx92VOVTR6vNBbrDR+dikFoK4SyjeWXXQh71PACvOQEWDM6zbYjLTJQbMk
/4rCiMBr+ypJAS3zChor6maXvQjVfXQMNBShgNUAXDN8xjDa0Qh20HYT0Hu0i0h7
qTakBtWJda4tdBFdZzo9DZLuz3ce5qDbgqTs6PlZHnCgfPoOBG40InLaN2f7BvM6
7IFJzKhJc4V1X3CTv4AydRjS6amKeiIZuh6vXYEufKSrBwpAf6Xe1W8cY08MQK5C
Gw5JTt51AgMBAAECggEAK0zXMDS4e4p8IpNbQ7fRyCnW+D/Oysb7RJ6y2Ki8oLhF
J4Y2FLLna6HQO+L6qN4+58/Lkky7RpQo6sUYUEE4OxjnfqTwi9rPh3vUTFTVbyM1
S1ayPq7nvJstet+xUCLSx2iyPgbhaW34rBMsJtvkE1p+uDPnigGgG/Yvvn2xh+P8
+X9V2zIrKZ12tudi7bQ+WWRS6/QY3GbQb3Y5N7E6aPCyxkazzt9OTrhuPigC/0Z7
8NeYpPqA1t7G+HIH/CUCUH4f9EMtbv3fJHcUzOiRoJ8cgTTF2SUE+DGA/PEF5zTA
gzNupMxUaE4u44H6pCLu/qEDRT9792f8gdb+l660UwKBgQDm8ADyX8fzwiBZyvc8
oyeaLPKjd1/v1Btc82xtr84YV8QJOjTtg4WnwqRKog1KjJO9CZ5PEAhzwyrFpJ+C
FfwKpFgoDuJrhjtB6PFzhpnPOXEaNm/CqC5xR1F+xQ01GmglPNUV2bg1KNHhv595
zJ8wdERWyFmnshIMKyOqLL3TewKBgQDOVpreLHaa1qsBvs24+5HA4H6qnd3bIlvo
K08I4cbWmOuBYq+itCxTkS1PnHk2Ax1ppTd0ikz5mCQmDClcSwBYp8Uc3teFyzn+
+hJW7uBbfW3xf+p/iLtp7T0OHsmCApffsjxli/0dZbb/2HUJhzyNIjo3OrHNuTU+
AT8AQYU6zwKBgQDegjbXUTQOCGg1PBtVYHpi0ZYDrJxSLtMijyRU1wRDbiTjIyMm
Cgg4aJD1nAgkYShkBqVy1ibeqxhGEGTj6RzMgCa0igrcwRvNWI1z2yfNgzIXqIWs
T3FYEfhSpbghB017O46wG/OhvK/kzEXzDBYBkLTbzPSdYDSFZvdZGvzXiwKBgQC8
oa342HshOIijEtStfMaVpmYGAkZU08djq1wYiZcmjiwWX6qjOsWfLARZWHnzJ8vW
zeSxlNGkCDNb2RhiuGo7ojxwFUTAmraNY/4qHT1cRoGhGsi9CLoUr352jyy2vzoq
lZ3jU6P1IQy4PiFYsZpoh9bisLTllqCW67q1uDBdPwKBgF6yDu8AqDNy7QsFruEA
3oeEsr08sQ9CblLqaetIL2B3fle8yta8vwbv96Mbpi1TkzgYz6OBwAGlnqv15UB9
8Vk4WZnAbEQiHO7jHUkfsYB3OacRxYjmn62rWgf1NTnz4FxvJrgzQ1OdIo4LRTzO
Rax0JQeV/SxbDE0s7I7mcUzs
-----END PRIVATE KEY-----

EOF
echo "da tao xong szn.key"
# Tạo file cấu hình config.yml
cat << EOF > /etc/XrayR/config.yml
Log:
  Level: warning # Log level: none, error, warning, info, debug
  AccessPath: # /etc/XrayR/access.Log
  ErrorPath: # /etc/XrayR/error.log
DnsConfigPath: # /etc/XrayR/dns.json # Path to dns config, check https://xtls.github.io/config/dns.html for help
RouteConfigPath: # /etc/XrayR/route.json # Path to route config, check https://xtls.github.io/config/routing.html for help
InboundConfigPath: # /etc/XrayR/custom_inbound.json # Path to custom inbound config, check https://xtls.github.io/config/inbound.html for help
OutboundConfigPath: # /etc/XrayR/custom_outbound.json # Path to custom outbound config, check https://xtls.github.io/config/outbound.html for help
ConnectionConfig:
  Handshake: 4 # Handshake time limit, Second
  ConnIdle: 30 # Connection idle time limit, Second
  UplinkOnly: 2 # Time limit when the connection downstream is closed, Second
  DownlinkOnly: 4 # Time limit when the connection is closed after the uplink is closed, Second
  BufferSize: 64 # The internal cache size of each connection, kB
Nodes:
  -
    PanelType: "NewV2board" # Panel type: SSpanel, V2board, NewV2board, PMpanel, Proxypanel, V2RaySocks
    ApiConfig:
      ApiHost: "https://vpngame.pro"
      ApiKey: "shizune1996shizune1996"
      NodeID: ${v2ray_node_id}
      NodeType: V2ray # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin
      Timeout: 30 # Timeout for the api request
      EnableVless: false # Enable Vless for V2ray Type
      EnableXTLS: false # Enable XTLS for V2ray and Trojan
      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable
      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable
      RuleListPath: # /etc/XrayR/rulelist Path to local rulelist file
    ControllerConfig:
      ListenIP: 0.0.0.0 # IP address you want to listen
      SendIP: 0.0.0.0 # IP address you want to send pacakage
      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.
      EnableDNS: false # Use custom DNS config, Please ensure that you set the dns.json well
      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy
      EnableProxyProtocol: false # Only works for WebSocket and TCP
      DisableSniffing: true # Disable domain sniffing
      AutoSpeedLimitConfig:
        Limit: 0 # Warned speed. Set to 0 to disable AutoSpeedLimit (mbps)
        WarnTimes: 0 # After (WarnTimes) consecutive warnings, the user will be limited. Set to 0 to punish overspeed user immediately.
        LimitSpeed: 0 # The speedlimit of a limited user (unit: mbps)
        LimitDuration: 0 # How many minutes will the limiting last (unit: minute)
      GlobalDeviceLimitConfig:
        Enable: false # Enable the global device limit of a user
        RedisAddr: 127.0.0.1:6379 # The redis server address
        RedisPassword: YOUR PASSWORD # Redis password
        RedisDB: 0 # Redis DB
        Timeout: 5 # Timeout for redis request
        Expiry: 60 # Expiry time (second)
      EnableFallback: false # Only support for Trojan and Vless
      FallBackConfigs:  # Support multiple fallbacks
        -
          SNI: # TLS SNI(Server Name Indication), Empty for any
          Alpn: # Alpn, Empty for any
          Path: # HTTP PATH, Empty for any
          Dest: 80 # Required, Destination of fallback, check https://xtls.github.io/config/features/fallback.html for details.
          ProxyProtocolVer: 0 # Send PROXY protocol version, 0 for dsable
      CertConfig:
        CertMode: dns # Option about how to get certificate: none, file, http, tls, dns. Choose "none" will forcedly disable the tls config.
        CertDomain: "${trojan_domain}" # Domain to cert
        CertFile: /etc/XrayR/cert/${trojan_domain}.cert # Provided if the CertMode is file
        KeyFile: /etc/XrayR/cert/${trojan_domain}.key
        Provider: alidns # DNS cert provider, Get the full support list here: https://go-acme.github.io/lego/dns/
        Email: test@me.com
        DNSEnv: # DNS ENV option used by DNS provider
          ALICLOUD_ACCESS_KEY: aaa
          ALICLOUD_SECRET_KEY: bbb

  -
    PanelType: "NewV2board" # Panel type: SSpanel, V2board, NewV2board, PMpanel, Proxypanel, V2RaySocks
    ApiConfig:
      ApiHost: "https://vpngame.pro"
      ApiKey: "shizune1996shizune1996"
      NodeID: ${trojan_node_id}
      NodeType: Trojan # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin
      Timeout: 30 # Timeout for the api request
      EnableVless: false # Enable Vless for V2ray Type
      EnableXTLS: false # Enable XTLS for V2ray and Trojan
      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable
      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable
      RuleListPath: # /etc/XrayR/rulelist Path to local rulelist file
    ControllerConfig:
      ListenIP: 0.0.0.0 # IP address you want to listen
      SendIP: 0.0.0.0 # IP address you want to send pacakage
      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.
      EnableDNS: false # Use custom DNS config, Please ensure that you set the dns.json well
      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy
      EnableProxyProtocol: false # Only works for WebSocket and TCP
      DisableSniffing: true # Disable domain sniffing
      AutoSpeedLimitConfig:
        Limit: 0 # Warned speed. Set to 0 to disable AutoSpeedLimit (mbps)
        WarnTimes: 0 # After (WarnTimes) consecutive warnings, the user will be limited. Set to 0 to punish overspeed user immediately.
        LimitSpeed: 0 # The speedlimit of a limited user (unit: mbps)
        LimitDuration: 0 # How many minutes will the limiting last (unit: minute)
      GlobalDeviceLimitConfig:
        Enable: false # Enable the global device limit of a user
        RedisAddr: 127.0.0.1:6379 # The redis server address
        RedisPassword: YOUR PASSWORD # Redis password
        RedisDB: 0 # Redis DB
        Timeout: 5 # Timeout for redis request
        Expiry: 60 # Expiry time (second)
      EnableFallback: false # Only support for Trojan and Vless
      FallBackConfigs:  # Support multiple fallbacks
        -
          SNI: # TLS SNI(Server Name Indication), Empty for any
          Alpn: # Alpn, Empty for any
          Path: # HTTP PATH, Empty for any
          Dest: 80 # Required, Destination of fallback, check https://xtls.github.io/config/features/fallback.html for details.
          ProxyProtocolVer: 0 # Send PROXY protocol version, 0 for dsable
      CertConfig:
        CertMode: file # Option about how to get certificate: none, file, http, tls, dns. Choose "none" will forcedly disable the tls config.
        CertDomain: "${trojan_domain}" # Domain to cert
        CertFile: /root/szn.cert # Provided if the CertMode is file
        KeyFile: /root/szn.key
        Provider: alidns # DNS cert provider, Get the full support list here: https://go-acme.github.io/lego/dns/
        Email: test@me.com
        DNSEnv: # DNS ENV option used by DNS provider
          ALICLOUD_ACCESS_KEY: aaa
          ALICLOUD_SECRET_KEY: bbb
EOF

echo "Đã tạo xong các file cấu hình."

systemctl restart XrayR
echo "khoi dong lai xrayR thanh cong"

