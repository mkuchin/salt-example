docker package repository:
  pkgrepo.managed:
    - name: deb https://apt.dockerproject.org/repo ubuntu-{{ grains["oscodename"] }} main
    - humanname:  Docker Package Repository
    - keyserver: keyserver.ubuntu.com
    - keyid: 58118E89F3A912897C070ADBF76221572C52609D

docker-engine:
  pkg.installed:
  - require:
      - pkgrepo: docker package repository

docker-service:
  service.running:
    - name: docker
    - enable: True
    - watch:
#      - file: /etc/default/docker
      - pkg: docker-engine
    - require:
      - pkg: haveged
      - pip: docker-py
    - watch:
      - file: /etc/default/docker  
      
/etc/default/docker:
  file.managed:
    - source: salt://docker/pkg/conf/docker      

# to improve start of java apps
haveged:
  pkg.installed

# removed due to ubuntu bug: https://bugs.launchpad.net/ubuntu/+source/python-pip/+bug/1306991
#python-pip:
#  pkg.installed

python-setuptools:
   pkg.installed
   
pip-install:
  cmd.run:
    - name: easy_install pip
    - creates: /usr/local/bin/pip
    - require: 
      - pkg: python-setuptools
    - reload_modules: True
    
# required for salt docker module
docker-py:
  pip.installed:
    - name: docker-py>=1.4.0
    - require:
      - cmd: pip-install

