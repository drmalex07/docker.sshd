FROM debian:latest

RUN apt-get update && apt-get install -y openssh-server rssh
RUN mkdir /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

ONBUILD RUN  mkdir /root/.ssh
ONBUILD COPY authorized_keys /root/.ssh/authorized_keys
ONBUILD RUN  chmod 0600 /root/.ssh/authorized_keys
