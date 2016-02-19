jenkins-volume:
  dockerng.volume_present:
    - name: jenkins

jenkins:latest:
  dockerng.image_present

#docker run -p 8080:8080 -p 50000:50000 -v /your/home:/var/jenkins_home jenkins
jenkins:
  dockerng.running:
    - image: jenkins
    - binds:
      - jenkins:/var/jenkins_home
    - port_bindings:
      - 8080:8080
    - watch:
      - dockerng: jenkins:latest
    - require: 
      - dockerng: jenkins-volume