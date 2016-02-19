base:          # Apply SLS files from the directory root for the 'base' environment
  'salt-minion*':      # All minions with a minion_id that begins with 'web'
    - nginx   # Apply the state file named 'apache.sls'
    - docker-test
    - docker.pkg
  'build*':
    - docker.pkg
    - mount.samba
    - jenkins
