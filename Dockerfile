FROM ubuntu

RUN apt-get update -y && \
    apt-get install -y curl sudo git build-essential && \
    useradd -m -G sudo dev && \
    echo "dev:dev" | chpasswd && \
    echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER dev

COPY --chown=dev:dev . /work
WORKDIR /work

# RUN ./install.sh
