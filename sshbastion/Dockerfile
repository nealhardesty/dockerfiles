FROM ubuntu:16.04
MAINTAINER nealhardesty@yahoo.com

RUN apt-get update -y && apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN useradd -s /bin/bash -m -d /home/neal -U -G sudo neal

# No passwords for sudo, yay!
ADD ./lib/sudoers /etc/sudoers

ADD ./lib/sshd_config /etc/ssh/sshd_config

EXPOSE 2222

VOLUME /home/neal/.ssh
CMD ["/usr/sbin/sshd", "-D"]
