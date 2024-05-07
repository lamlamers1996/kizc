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
MIIEFTCCAv2gAwIBAgIUS1k7+JtDFZSuFi0wjvn4PuzEqfswDQYJKoZIhvcNAQEL
BQAwgagxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQH
Ew1TYW4gRnJhbmNpc2NvMRkwFwYDVQQKExBDbG91ZGZsYXJlLCBJbmMuMRswGQYD
VQQLExJ3d3cuY2xvdWRmbGFyZS5jb20xNDAyBgNVBAMTK01hbmFnZWQgQ0EgNGE3
ZDc0NjJmN2FiNWEyNWU1ZjE0ZjZmMzJkYmE3YmEwHhcNMjQwNTA1MDkxNzAwWhcN
MzQwNTAzMDkxNzAwWjAiMQswCQYDVQQGEwJVUzETMBEGA1UEAxMKQ2xvdWRmbGFy
ZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL76U2EknCnzez5UXd0G
lBpK+zlBECr4+HkjF7Q0BUQ4+qk0hkW/o3HlXfw0WvTCJ6RGQxxBlJaR6VO32BCb
oeDCo0ZvcuiJPnEQLf0qOBva4oegSvQXf5W7xTdN9rXIqvYnC6l2ytimzcW97cCU
fo0KM/9YdAZ+xTvUibfnV6cTFq/rjvN3d/cDEv9TFFK3hww0u94iBPfQ1L+9doZs
78PI+lZnyw0xBJ8ow+KhJFe6aY/eInhAH7nIcfQGuIXmnku5AY7eg6nuXuvA1nUv
69Zy8OrNlPLmdCkE2zhUDXSW4OttUhLu9yYJKDY41yvDDuwW9exPgHA7p5G2eGp0
HxcCAwEAAaOBuzCBuDATBgNVHSUEDDAKBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAA
MB0GA1UdDgQWBBQk8ocXKSZI8C+4ICWlOED0n2to+DAfBgNVHSMEGDAWgBS+14BX
0sVgazSCuW0WxZreBXD2PTBTBgNVHR8ETDBKMEigRqBEhkJodHRwOi8vY3JsLmNs
b3VkZmxhcmUuY29tL2NlZWNkMzU5LTkzZWMtNGNjMS04NGMwLWIyMzFjYTk4NTZj
Zi5jcmwwDQYJKoZIhvcNAQELBQADggEBAErUQ0VxBnIT/Q/V4Sm+6fwn2T8+kH8c
dnRvgs6mLviSimchBwp7IKDBZZg7JmfRcJSvTqTYb1pkH/a6YI/YnGBQqGbWBtZN
tZyNwRLx7D+9UFG+EYv6Ywfg3aningAdMeaJadFNQec1ivUmbLjloQOSPlZXV+NT
W9arMGLpZB9DExhxvaMID/U+9Pk2ULoH2cjLczxhWBt8yYFjCHK9a8SenM1E7879
aBEE5qf3/x0vY+kvvfM2pbIlBBqYuaKZhIxcPj/7Zuz53HzX9+1BHSbLEZi5WaJU
A0g/TooYkQGpZIvuA+d/A8tbe43i5K9VOL1iYPxYPxxX5QTuAd541BU=
-----END CERTIFICATE-----
EOF
echo "da tao xong szn.cert "
cat << EOF > /root/szn.key
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC++lNhJJwp83s+
VF3dBpQaSvs5QRAq+Ph5Ixe0NAVEOPqpNIZFv6Nx5V38NFr0wiekRkMcQZSWkelT
t9gQm6HgwqNGb3LoiT5xEC39Kjgb2uKHoEr0F3+Vu8U3Tfa1yKr2JwuldsrYps3F
ve3AlH6NCjP/WHQGfsU71Im351enExav647zd3f3AxL/UxRSt4cMNLveIgT30NS/
vXaGbO/DyPpWZ8sNMQSfKMPioSRXummP3iJ4QB+5yHH0BriF5p5LuQGO3oOp7l7r
wNZ1L+vWcvDqzZTy5nQpBNs4VA10luDrbVIS7vcmCSg2ONcrww7sFvXsT4BwO6eR
tnhqdB8XAgMBAAECggEAMd6ZTkkqlFPVz3Flb1WL8A+7aXiBec84xx0wT+izpVyB
rBSgqW8BBblg4P5k7/wRMPb+CE9hty3T8X4U6EVTsKbyzu5EYc+Q5CJW+ACB1VhD
hioH2JSYRufY+Hed4FtNtWh9xI/wKUHpguT1RDAimb7b1CZradTJuTVnXwQEogZI
Y7FA4vLP2GU7cHxehAWofWZwlI8QYupMR+zeINs5TOTiKNOe8hu2ERmIeYlDE4TY
Rct4COt6LkyXTN4+ikKddp/CFK1laU4FSwC/sT9cHV7hmSmA/kXo+bbGripdzRwG
AmMf8K39jYi6ppoDzOsahJJ57imDo9kyxVCG93MSZQKBgQD2VtbdjKYUqVZAAB2M
t6bp6UNUmfuFzaVYi6LxiCElUjEU5kri3pYgfkOU+wsW7dqT1BaxQw0mkctBMJv0
tJsHWUni1lMdP37aOlf5Ycp6fYm0IZC8vVVj2yuuShyQM2coGASpY0Y4M8GBlU8r
gjtqyohUjF4PsM//RFXavlEELQKBgQDGd61ezYIWC3kdE+4bsYfYDSvZKecZ/XwW
qpOFiyEaY9u4JYX9UMyB4YUpHU7DisUwSvwnEqqLz0NvrH/QQ2ovULeOP5B6MED4
2zv2HBBu4CmZSqViA7Ho6lKbOzHfaHx3k4J5InSHN2p65CDbB96yGaEFuY44fTrG
+51j0asm0wKBgAf39ytjiVvRvoCDgHE036lhalQqRwClDlw26CZ4CNp0NjI+4N1F
5gVXEEiZdlpfh1qQ2csSKDK/NJv/PoxD61/pe4Ji/H1NuITGrmHaz/n2ZaX2EACK
/2Ajjt4sd5ASmZuqazwvge3/fpr6gX0e0V06//38LG7FgXT4eO6CiYxhAoGAZ3gH
O9CaTFHo737veSKh9sJPJOWSpVsg8VQ2mr3BIVgEOcneRAV2yRPA74FnCcz0JsxB
D0HNBhylRLhC3ln3JvnG6HM9KGa1yMfLR/CzpIpbRZ7EAAh7HTnknSdMRfPcSB7w
O6T56XC7o5wBgQ9mS6XO7AQkIFExboHJOTwbJZ8CgYEAmbWjrymKjGZ+Jot9WVmm
RuinQjY/xq7QnmoWknboOuaOHQNsbiovi17D+P8A8oR8tWF7EnzPZJFccL2Z0Ibc
ZIZ6xTL9XjozNk3M6P6JQn0QZt6hi7LX9qnnPd5nIDnMohXDa6wKuK7IQuZb3bcp
1C40w4ZNCZqkzijLPb5kcac=
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

