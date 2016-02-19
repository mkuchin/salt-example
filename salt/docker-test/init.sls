hyper/docker-test:
  dockerng.image_present:
    - force: True  # Ensures a new image is always pulled if the current one is out of date
    - require:
      - pkg: docker-engine
      - pip: docker-py

docker-test:
  dockerng.running:
    - image: hyper/docker-test 
    - restart_policy: on-failure:5
    - port_bindings:  # OR bind a specific port (then it will never change)
      - 8080:8080
    - watch:
      - dockerng: hyper/docker-test  # Recreates the container on changes to the image
