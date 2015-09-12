package { 'git' :
    ensure => 'installed',
}

File {
    owner => 'puppet',
    group => 'puppet',
}

file {'/var/lib/puppet/.ssh':
    ensure => 'directory'
}

file { '/var/lib/puppet/.ssh/id_rsa':
    content => '-----BEGIN RSA PRIVATE KEY-----
MIIJKQIBAAKCAgEAw4+XwWTcp/T8DnT9uLjncYzEoJvILmuC3rmxYzxS7eI9n888
pft2nyNyBk8gZbcE7c1b9oj8dRemfZc5l4vuRDQa69oiUk7KNf93UmTMthYBZG3p
YanPKb9BDAQN4MWxr0KzYBMFJaM7fulMOJpJMf15nZIuiXI+DPnz6dAENCX21/YH
qeiOjJrIVvm9tSn7V3a0PqRYvOau3LFZQ0Yf/L+KYwQAgfTjMHVnr9o+Ed8bAr3+
Ff3VlO1PZsIic12qjfNaLhaHbJR0/Sfjgj/e7s6BHTqjwpEVCO+3XNqvmu0cVZs9
Ak7bDmX0CenluOmG3d7MFvU2pN4FDoqgBxRzP3F9qvyi0pq496hdL4g9ixNA5iV6
HuMzS3XBed5hEb5B0xGdWXZW/pma8cxif4fTVQLXFRbrBWVQq1AP+2+hb6tjFlKy
GXmAeupTqffAPuLXSC77wRKIk1pkf5PCQb71Ww8X8B8Al3TSzvEiLT/YTfRMPFbG
ovpvCaZIzcCB5uj5X0xQFoz+pbRtCbt6TTguWgJYbF0/HeEc4kEhp3J9GRI4ovJG
5GnfaFSPArDAWkdeGx9+PUAA1VrMhAQYhwtWDW3Ap2CSZD5sWCw2pJfP1g8pokyu
gSqcevcySeKMcmB0lK3eMnh3GSUuxLG8s07dH9Vuh94rcqB6aPz6B1CTUtsCAwEA
AQKCAgBPADQTCVbmdt5YTMSumevNgEtyglwk/IOazDMv3o+1z76LT6G1f9dUxHHs
wIxa6suP8XTkLESoXMyCUdQPN5UiclYpzy4sR+4CUFh4rYXRTSR02L3+GSY6PCvf
2cdtdQ+puG1UM3rR0JZZV4/WEeXdzwMRN5ubJM6SWWtCmikIlAmbBqXj6rGjdWfX
Uv5jMDl8BNUdtTCv5xTezLo9pheH+CzEgTpfRXl9+v/PF4AZoiJ8Qhph8fAVQKTh
4y0do8ohnBxjH/DHWVXFaxbKaFj76epYz3aWRBvWR1iwpxtnn7/hiVvlEcwGjgM+
+gE2aQh1muqhn5/ajGJIlJG/KnC/i/ePCT5wn+gX2X7J8a5IVvfDqJU5WsY/orxJ
O3fw/Gz2S/jVfzUYOpUTjkN5wzH9QELs2sfWj2CnfmQq7Tkpqs9+fatilLfpERX4
CDG82HwZaTLEexqxq0bj4uqqnblC1my01VEFy15YcTY7AjTZh4VB8C98feszKIUr
6x+FtZR+oAJ2LzuzHaMJh1S0zI+sksVJsZI7117y5oZlB1BhCqRdW6+nZ/e3B2RU
nOZbIQhVJgopBfcbdxme0YxxKFZQNTAGWzbqVZsd+2d+BXfHMgxSTlO83VKzsuUR
QGqtikIPnLdvnygGFIjAoFMi93jhigb7eD3TP3J2uXPYYvvh0QKCAQEA9Bsfo7Nx
rvEbGfDlP1QsQ9/H2J5kjQw/f+Z2ZrgCkEohv/cQZ91Q20AKE8LB0lohf7WeOjiz
DwrSKq6VMBqKIdw2Qqj2TmHn8WR2TkP3KCQba8ZkP/gxpYKjKFaXbwJqWTYscaqd
qqt9kn94yxyZzuxr9Ph1XHYR+N0JR8HkCdBLnrgmX/l76C4r9nWIQOZeRvHy40FQ
EdnepKT7CYK89x2vo6/ufqc7xobSQmVf7AjjdAjAbkWHa7zUBrTuc+WuxLnCtmhW
wIQ4PXrCc1ZcQvNW+9oQXg/THjZ3+i7vi+5szCov4RrkpPYqfE/ixNZYyegrYkvw
g0vxqkWRz3488wKCAQEAzRbwQCNLoBwkrOoYhWHo/pW5W2IOop9tkvnZkmUWhltg
0ize4Bg8I8aI92rbueeLlGEgjhOrvTZW76QCb5BsEbhe2PgWbsWswFalHNrANYg2
2sftIaE6Znx5iBDiA7dBM9JlpBfbmQMHsT7Jr5y3K0FhMC1qjOO2k0zq4sCkL96r
B6eGBuxn7kfd8yPOpvY1AoVTTX468YNfJdlcJXij1/w/7/HLhZAUWdyPc3YP26SG
YrPf5ElCGKsWNtBNrKY2xMukl6AN0MeXQkEk8JSLQLl8jmUnChwSzkqdg35lvrQv
EXhToqDqDMxDhViD+F3Z67eBq60dorXdz5c114ZseQKCAQEAvL/YWCkhp2bxUL6v
VKeOTrFTgxD+qP2mgAxA0y5HdTCNJjUw7072/YFoCV2Xp0JgErLpdRVwhxoT5kL2
QqrS0lnHbwXc5kDYKxRGUkBFdTluJojR7ZDJOrRn2oISOBkDCJZWCVIm9dgCkeuV
CGDGIXU4CMSxYtw9C1RGn8CxxlDUmBbGPYHYqHBDOCArShuXHH5rFAPlmNgBSwfy
wKjh2qaOsCASZsaC9wA6xnJCmG1LCubVfK6whsMMo1713pHj8GO+xnKpWdUi847f
mnVVg8NLKBS2gTT1RrBRVxdBzM6AO+IHAaVc1J0vvs26h/9BymWGXkxf3fY0GDgR
BgMTtwKCAQAkue7cDXYFfgSzUliByj7HGFjRHIYyaQpeP4/Ov3uBI+v6tz5SMwTS
A0OTyvb+G5DLSXli9/LRN2HqGBy3jc1Mfw+9GvApdgyxhNKckC/LZlEsbJDybMTg
hXnd++f9cluixBKfiAYzKG/ANdY4NIA4psSYtAlYoY6YYjXN1WGRkPZfsIg3xS33
ZbdBSzA+heiIQwff4LL9fOEVDg+KRkhQ7UMl3M7tZBfA39ZwfrvoQVYvZra5UsUb
VcfsmPDP8hPsuesHnAndUWCs5K2Qx4kIVi8P8N1E2jIj7wi1+3SM6gdjwYB4pwhC
snGE94zqdSQJKht2etHLyXWnLxTdO51BAoIBAQC2hh6jp2FaGHwVsTVO0bdsGVAh
NYek9xires2VKEdbfTiizcvHKb/acaIpP6UDIXc1FDFyJvfmJJvtshaHoq8qiS+o
oNlLorIVSGOanDc0ZtKrp3TPUPhHMnGTo1kUkF95sUSiQz8xEfgiVoIBhIyOqnQ3
WPE9tArWUX3mQ0nVndeDjWQfm68V9F5co3jLo4A+KeZLOR7FAcUbGmHJERG9nBIg
Z3p8JYOZ0OGM+0LIf5TiP3MbXoF5s9KRVuskFbYNrmtb8fJ1GULkzJC1tkFSPJ4A
nK9nwzX86MeTaJtb9Au5DYQiuE2dZWF4p2MxeDCJ5eugZ915vn6eBEzUorjo
-----END RSA PRIVATE KEY-----',
    mode => 0600,
    require => File['/var/lib/puppet/.ssh']
}

exec {'download github.com host key':
    command => 'sudo -u puppet ssh-keyscan github.com >> /var/lib/puppet/.ssh/known_hosts',
    path => '/usr/bin:/usr/sbin:/bin:/sbin',
    unless => 'grep github.com /var/lib/puppet/.ssh/known_hosts',
    require => File['/var/lib/puppet/.ssh'],
}

file {'/etc/puppet/environments':
    ensure => 'directory'
}

exec {'create production env':
    command => 'sudo -u puppet git clone https://github.com/pengfei1/puppet /etc/puppet/environments/production',
    path    => '/usr/bin:/usr/sbin:/bin:/sbin',
    require => [Package['git'], File['/var/lib/puppet/.ssh/id_rsa'], Exec['download github.com host key'], File['/etc/puppet/environments']],
    unless  => 'test -f /etc/puppet/environments/production/.git/config',
}


