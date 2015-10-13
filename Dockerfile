FROM debian:latest

RUN apt-get update && apt-get install -y openssh-server rssh
RUN mkdir /var/run/sshd

#RUN echo 'root:screencast' | chpasswd
#RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
