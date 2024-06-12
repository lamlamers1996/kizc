
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
MIIEFTCCAv2gAwIBAgIUB99APB7HkLALF0uMwOG23Jvx+1owDQYJKoZIhvcNAQEL
BQAwgagxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQH
Ew1TYW4gRnJhbmNpc2NvMRkwFwYDVQQKExBDbG91ZGZsYXJlLCBJbmMuMRswGQYD
VQQLExJ3d3cuY2xvdWRmbGFyZS5jb20xNDAyBgNVBAMTK01hbmFnZWQgQ0EgNGE3
ZDc0NjJmN2FiNWEyNWU1ZjE0ZjZmMzJkYmE3YmEwHhcNMjQwNjEyMTUxNDAwWhcN
MzQwNjEwMTUxNDAwWjAiMQswCQYDVQQGEwJVUzETMBEGA1UEAxMKQ2xvdWRmbGFy
ZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOLlrRP75BHlYQ8d79wM
NJy1k0yMjFWCgO00uCawkrUmwazYh6HRefPKysNIJbwzlHx54ystS4wDKYJgRmz8
yQBDWJwNIDaajVRnRpCWwuvyPilniy4XLP/PNcViTj8btwsR3VLkQ1lgo5vLcVq/
PAI07NH4Tvyn4jIvS6Dxi02E/QkV2R1O4KpqUV+NzdTJQv2JkxbDbUD8Jt4pkgEm
UGVmDMe9W9XLHfPpoRlMoG7dlWXJikKnwPEreQ6QT6THVfIkHOYPMTUB+900Xtaa
c9BrVNV/rwbDPIltUAeS0+YLrF3Y4eMDrRkQaiBVeIu1adogz7/8A5CVo2/YDizB
xlkCAwEAAaOBuzCBuDATBgNVHSUEDDAKBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAA
MB0GA1UdDgQWBBRAW5+LrtHyy6n6PtRzLOvmkXFSrTAfBgNVHSMEGDAWgBS+14BX
0sVgazSCuW0WxZreBXD2PTBTBgNVHR8ETDBKMEigRqBEhkJodHRwOi8vY3JsLmNs
b3VkZmxhcmUuY29tL2NlZWNkMzU5LTkzZWMtNGNjMS04NGMwLWIyMzFjYTk4NTZj
Zi5jcmwwDQYJKoZIhvcNAQELBQADggEBANp5GNo84JAUvAlwVvze8RL99t8vp0rq
pE2hu/81b3RlhYNvpb/C8w4vs0tdS/dwYuoAZZXV0ZeIgNPvhgv4nexNRcMZ2g+j
NHkPCP4/fK4TiBb/5SwAbpPsYK9vkV1Z/tZaOUiSzzIS7Y+eViqYpO7I6OYj28Ba
4csBYYW5TGIthEm7Af6mb1QfsZ9BjRy0vsovZHH9MvxV1ttbEB+vG/xAT3evDHIr
TcckwA5g7Sf9SCwslb5n3tylh0E7pLnSt54ZcgzXPhsfYW4uIc1/ovSF/VUFA/kK
zuZV1IUIKksubmH+trAGekqmfmQOfzy/+byOdFqOwcLj49mHy5YStuQ=
-----END CERTIFICATE-----


EOF
echo "da tao xong szn.cert "
cat << EOF > /root/szn.key
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDi5a0T++QR5WEP
He/cDDSctZNMjIxVgoDtNLgmsJK1JsGs2Ieh0XnzysrDSCW8M5R8eeMrLUuMAymC
YEZs/MkAQ1icDSA2mo1UZ0aQlsLr8j4pZ4suFyz/zzXFYk4/G7cLEd1S5ENZYKOb
y3FavzwCNOzR+E78p+IyL0ug8YtNhP0JFdkdTuCqalFfjc3UyUL9iZMWw21A/Cbe
KZIBJlBlZgzHvVvVyx3z6aEZTKBu3ZVlyYpCp8DxK3kOkE+kx1XyJBzmDzE1Afvd
NF7WmnPQa1TVf68GwzyJbVAHktPmC6xd2OHjA60ZEGogVXiLtWnaIM+//AOQlaNv
2A4swcZZAgMBAAECggEAG14CDgjCFdGBrznYakVznBo/kcpbC95RkCrdclc2XtC1
qBQ26dLzH29snPjJCmX7STdHafgM5m6kNVRI8lDcKqK035+qrMNf/Bf32C1DBgQC
MOrLDAxiElnLHctxbiW44oYtWJftMqzYFwzHF5+8zHRXQy0s08cpHo37VIaF25vO
aIJLtF/iKTj6SUG7mOfL1FFiv1taku8ALXwnpM+djeajUFYzapkZtsACB6J/tbyt
q+DhcR3oRXlY22X3H9yNSXdzb4icyHHuZ951m+otegtBpU4p+YoPpVEQs21vbXV2
fZdE5hQVJhpIlz1dCvtVd/oaIiyqxT0+GRniHqyqAQKBgQDyCmeW5g/o4JRERQp/
E9ykzskTQQ9vkic1SeZtQGDFAzMJUzoUlFskZZrHwg6dTe9pyp/uFgxw8FgqXamo
bE/N7Wp/9oPdcgLVFxnYkgsYgif6y737d0EtSaRHAIqrjha7hjtA7SssKlQBo3DL
YyShylqUcxPR85luiqMVk1i5WQKBgQDv+6+/5AMcL7d6mYlki20+8OWHuI2C0aLE
Ra0MYktj7/onVMIdSEUs3htlOclfWNkCYrBAOTnLhpUJDdZScNH6vmqUQ9WTvNH+
nTR5YeZv2vRp7elEfNQYKL6EeTYBDA5+ofoOvHmpxdwEsN+lwVk71H1/hRHwy+dE
OhUB6ILVAQKBgEiehIwKxLU7RGDjUg3kmKu9+yhSud3gvPDJFmCrEx2pIxPmK6Pn
Cx11eqX6fEYIDw/vomJdrSfphJpZdcC5lowTcoOoI9I6Fc13W+LVloyo6HPf00Vy
d1SuJqLC79gfDoT+9iI5xl0+6et/7SSov2Hng5vMlyLD8sHuyJV9mv4pAoGBALSK
jLW4O/7AhzBcwdg6bH2ljYiFdzCrteAi6wUeDcmpiHB+e2q8LA6NKd8FklGA7gG1
bRNj+e772LNvDYYICnCxQE06mzsCGpmKeye2Vz5fYvEuYwd7QbTLMklHRzGSeHUc
NptPf9gRWmzNA/QXeaJhQejlm5GkVOAnMha1bXgBAoGAP2BhaKZ9ClFzngZunZM2
CWr8/yo3eE9LYATxeDCHK1F41esWt+UOpnyBg2yDDM7TrI+50NnTes3W5nyOdGqq
lS50Syhl2hYMPYdVbR+R4XDGZWEt1NOgdfUuXxcwTPHbymAX4PgCeNdJLS3bVBqT
ud7Y32dcBZPl+BlJ+a+Ibew=
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
      ApiHost: "https://shizune4g.io.vn"
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
      ApiHost: "https://shizune4g.io.vn"
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
