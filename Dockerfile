FROM ubuntu:24.04

# Prevent interactive prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Update package index and install tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        netcat-openbsd \
        curl \
        wget \
        dnsutils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Default command
CMD ["/bin/bash"]
