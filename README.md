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

Once you've got the Symform web interface running on http://localhost:59234 you must log in with your Symform account. After completing the configuration wizard check the <your_config_directory>/node.config file to see which port Symform has chosen for your contribution service to listen on. The line to look for should be similar to this:

    <contribution enabled="True" fragmentStorePath="/contrib/SymformContribution" port="53068" manualPort="False" localAddress="" registrationAddress="" enableBackgroundTasks="True" concurrentMoves="2" logicalVolumeSize="0" ignoreThrottle="False" enablePortForwarding="True" testFragmentConfirmAction="NotSpecified" enableUtp="True">

In this case, port 53068 has been chosen. You may now stop/delete this docker image and run another one using the following command in order to enable contribution:

    docker run -d \
      -v <your_config_directory>:/var/lib/symform \
      -v <your_contrib_directory>:/contrib \
      -p 59234:59234 \
      -p 0.0.0.0:53068:53068 \
      flyte/symform
