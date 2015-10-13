# docker.sshd

A dockerized SSH server. 

This build is a tweaked version of https://docs.docker.com/examples/running_ssh_service/

## Quickstart

Create a container and setup port forwarding (e.g. from host's 10022):

    docker create -i -t -p 127.0.0.1:10022:22 --name sshd-1 --hostname sshd-1.internal user/sshd
    
Start the container, and start a bash shell in order to set root's password:

    docker start sshd-1
    docker exec -i -t sshd-1 passwd
    ...
    
Afterwards, you can copy your authorized keys into the container, e.g.:

    ssh-copy-id -i ~/.ssh/id_rsa.pub -p 10022 root@localhost
