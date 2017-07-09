FROM frolvlad/alpine-glibc:alpine-3.6

ENV MITAMAE_VERSION="1.4.5" \
    XDG_CONFIG_HOME="/root/.config"

RUN apk add --update --no-cache --virtual build-dependencies \
        curl && \
    curl -fSL -o /usr/local/bin/mitamae "https://github.com/itamae-kitchen/mitamae/releases/download/v${MITAMAE_VERSION}/mitamae-x86_64-linux" && \
    chmod +x /usr/local/bin/mitamae && \
    apk del --purge build-dependencies

COPY . /dotfiles
RUN mitamae local /dotfiles/roles/linux.rb

CMD ["fish"]
