docker-symform
==============
This repository contains the build files for installing [Symform](http://www.symform.com/) on an Ubuntu 14.04 docker image. The image is based on [timhaak/docker-base](https://github.com/timhaak/docker-base).

Usage
-----

    docker run -d \
      -v <your_config_directory>:/var/lib/symform \
      -v <your_contrib_directory>:/contrib \
      -p 59234:59234 \
      flyte/symform
