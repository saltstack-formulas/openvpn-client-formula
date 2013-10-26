openvpn-client-formula
================

A saltstack formula to manage openvpn clients in a certificate-based vpn.

Place the ca certificate next to init.sls as ca.crt, and the client keys and certificates into the keys directory. keys and certificate filenames are matched to minions by minion id. The openvpn server domain is pulled from pillar.
