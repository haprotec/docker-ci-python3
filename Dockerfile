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

# Install create-deb-package
ADD https://downloads.haprotec.de/create-deb-package/create-deb-package.deb /
RUN dpkg -i ./create-deb-package.deb && rm create-deb-package.deb
