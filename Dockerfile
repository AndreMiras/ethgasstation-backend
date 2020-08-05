FROM ubuntu:bionic
RUN apt-get update
RUN apt install -y software-properties-common

# RUN add-apt-repository -y ppa:deadsnakes/ppa

# RUN apt update

RUN apt install -y python3 python3-pip
# RUN apt update
# RUN apt install -y python3.8-distutils
# RUN apt install -y python3.8-pip 


# RUN apt install -y python3.8-distutils

# RUN python3.8 -m pip install --upgrade pip setuptools wheel

RUN python3 --version

RUN pip3 --version

ADD requirements.txt /opt/ethgasstation/requirements.txt
RUN pip3 install -r /opt/ethgasstation/requirements.txt

ADD settings.docker.conf /etc/ethgasstation.conf
ADD . /opt/ethgasstation/
ADD ethgasstation.py /opt/ethgasstation/ethgasstation.py

CMD /usr/bin/python3 /opt/ethgasstation/ethgasstation.py --generate-report
