#!/bin/bash

set -e

GO_VERSION="1.26.4"

if [ ! -d "/usr/local/go" ]; then
    ARCH=$(uname -m)
    case "$ARCH" in
        x86_64)
            GO_ARCH="amd64"
            ;;
        aarch64|arm64)
            GO_ARCH="arm64"
            ;;
        *)
            exit 1
            ;;
    esac

    TARBALL="go${GO_VERSION}.linux-${GO_ARCH}.tar.gz"
    URL="https://go.dev/dl/${TARBALL}"

    wget -q "$URL"
    tar -C /usr/local -xzf "$TARBALL"
    rm "$TARBALL"
fi

if ! grep -q "export PATH=\$PATH:/usr/local/go/bin" /etc/profile; then
    cat << 'EOF' >> /etc/profile

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
EOF
fi
