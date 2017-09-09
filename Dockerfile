FROM python:3

RUN apt-get update && apt-get install -y \
    git \
    mono-complete

# Install gitsemver
ADD https://downloads.haprotec.de/gitsemver/gitsemver.deb /
RUN dpkg -i ./gitsemver.deb && rm gitsemver.deb

# Add haprotec Python library
RUN git clone https://gitlab.com/haprotec/haprotec-python-lib.git
RUN pip install ./haprotec-python-lib

