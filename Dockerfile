FROM debian:latest

RUN apt-get update && apt-get install -y openssh-server rssh
RUN mkdir /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
