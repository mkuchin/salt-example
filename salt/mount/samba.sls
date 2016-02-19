/mnt:
  mount.mounted:
    - device: //{{ pillar['samba']['user'] }}.your-storagebox.de/backup
    - fstype: cifs
    - mkmnt: True
    - opts: ['nofail', '_netdev', 'iocharset=utf8', 'rw', 'credentials=/etc/backup-credentials.txt', 'file_mode=0660', 'dir_mode=0770', 'uid=nobody', 'gid=nogroup', 'sec=ntlmv2']
    - extra_mount_invisible_keys: ['credentials', 'iocharset', 'dir_mode', 'file_mode']
    - require: 
      - pkg: cifs-utils 
      - file: /etc/backup-credentials.txt
      
cifs-utils:
  pkg.installed

/etc/backup-credentials.txt:
  file.managed:
    - source: salt://mount/backup-credentials.txt
    - user: root
    - group: root
    - template: jinja
    - mode: 600
