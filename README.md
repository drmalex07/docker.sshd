# docker.sshd

A dockerized SSH server. 

This build is a tweaked version of https://docs.docker.com/examples/running_ssh_service/

## Quickstart

Assume that this image is tagged as `alexakis/sshd`.

Create a dockerfile for a child image in order to be able to provide our custom authorized keys:

```dockerfile
FROM alexakis/sshd
```

Provide an `authorized_keys` file inside the child dockerfile directory:

    cat ~/.ssh/id_rsa.pub >> authorized_keys

Build the image, say as `local/sshd`:

    docker build -t local/sshd .

Create a container and setup port forwarding (e.g. from host's 10022):

    docker create -i -t -p 127.0.0.1:10022:22 --name sshd-1 --hostname sshd-1.internal local/sshd
    
Start the container, and try to start a secure shell:

    docker start sshd-1
    ssh -i ~/.ssh/id_rsa -p10022 root@127.0.0.1
