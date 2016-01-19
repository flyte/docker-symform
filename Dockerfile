FROM timhaak/base:latest
MAINTAINER Ellis Percival <docker-symform@failcode.co.uk>

RUN apt-get -q update &&\
    apt-get install -qy --force-yes supervisor && \
    curl -L http://download.symform.com/control/current/linux/x64/Symform.deb -o symform.deb && \
    dpkg -i symform.deb && \
    rm symform.deb && \
    /opt/symform/mono/bin/mono /opt/symform/mono/lib/mono/2.0/mozroots.exe --import --ask-remove && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

VOLUME ["/var/lib/symform", "/contrib"]

ADD ./supervisor-symform.conf /etc/supervisor/conf.d/symform.conf

EXPOSE 59234

CMD ["/usr/bin/supervisord"]
