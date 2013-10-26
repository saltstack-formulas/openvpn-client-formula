#!jinja|yaml
/etc/openvpn/client.conf:
  file.managed:
    - source: salt://openvpn-client/client.conf
    - template: jinja
    - context:
      id: "{{ grains['id'] }}"

/etc/openvpn/ca.crt:
  file.managed:
    - source: salt://openvpn-client/ca.crt

/etc/openvpn/{{ grains['id'] }}.crt:
  file.managed:
    - source: salt://openvpn-client/keys/{{ grains['id'] }}.crt

/etc/openvpn/{{ grains['id'] }}.key:
  file.managed:
    - source: salt://openvpn-client/keys/{{ grains['id'] }}.key
    - mode: 700

openvpn:
  pkg:
    - installed
  service.running:
    - enable: True
    - require:
      - pkg: openvpn
    - watch: 
      - file: /etc/openvpn/client.conf
      - file: /etc/openvpn/{{ grains['id'] }}.crt
      - file: /etc/openvpn/{{ grains['id'] }}.key
