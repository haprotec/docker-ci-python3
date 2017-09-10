FROM python:3

RUN apt-get update -q && apt-get install -yq --no-install-recommends \
    git \
    mono-complete \
    && rm -rf /var/lib/apt/lists/*

# Install gitsemver
ADD https://downloads.haprotec.de/gitsemver/gitsemver.deb /
RUN dpkg -i ./gitsemver.deb && rm gitsemver.deb

# Add haprotec Python library
RUN git clone https://gitlab.com/haprotec/haprotec-python-lib.git
RUN pip install ./haprotec-python-lib

RUN useradd -ms /bin/bash gitlab-runner && \
    mkdir -p /workspace && \
    chown gitlab-runner /workspace 
USER gitlab-runner
