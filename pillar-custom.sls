# vim: ft=yaml
# Custom Pillar Data for infratest

infratest:
  enabled: true
  file:
    '/etc/passwd':
      exists: true
      type: file
      mode: 0644
      user: root
      group: root
      contains: root
  package:
    'exim4':
      installed: true
      version: 4.84
  service:
    'exim4':
      running: true
      enabled: true
    'sshd':
      running: true
      enabled: true
  socket:
    'tcp://22':
      listening: true
  systeminfo:
    type: linux
    distribution: debian
    release: 8.3
    codename: jessie
  sysctl:
    'kernel.osrelease':
      value: 3.16.0-4-amd64

