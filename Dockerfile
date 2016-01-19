FROM timhaak/base:latest
MAINTAINER Ellis Percival <docker-symform@failcode.co.uk>

RUN apt-get -q update &&\
    apt-get install -qy --force-yes supervisor mono-devel && \
    mozroots --import --ask-remove && \
    curl -L http://download.symform.com/control/current/linux/x64/Symform.deb -o symform.deb && \
    dpkg -i symform.deb && \
    rm symform.deb && \
    apt-get -y remove mono-devel && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

VOLUME ["/var/lib/symform", "/contrib"]

ADD ./supervisor-symform.conf /etc/supervisor/conf.d/symform.conf

EXPOSE 59234

CMD ["/usr/bin/supervisord"]
