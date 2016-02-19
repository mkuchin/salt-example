base:
  'salt-minion-*':
    - data
    - docker
    - schedule
  'mavensearch':
    - docker
    - samba.backup
