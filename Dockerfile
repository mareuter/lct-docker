# Base image
FROM python:2.7
MAINTAINER Michael Reuter <mareuternh@gmail.com>

RUN apt-get update && apt-get install -y \
  python-qt4 \
  python-virtualenv

RUN mkdir /opt/tools
WORKDIR /opt/tools

# Install lct in a virtualenv along with dependencies
RUN virtualenv .
RUN . bin/activate \
  && pip install pyephem qdarkstyle tzlocal lct

# Make links for PyQt4 into virtualenv
RUN ln -s /usr/lib/python2.7/dist-packages/PyQt4 lib/python2.7/site-packages/PyQt4
RUN ln -s /usr/lib/python2.7/dist-packages/sip.so lib/python2.7/site-packages/sip.so

CMD . bin/activate \
  &&  python bin/lunar_club_tools.py
