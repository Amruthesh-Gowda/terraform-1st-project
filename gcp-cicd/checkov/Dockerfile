FROM marketplace.gcr.io/google/ubuntu1804
RUN apt update && apt install software-properties-common -y
RUN echo -ne '\n' | add-apt-repository ppa:deadsnakes/ppa && apt install python3.7 -y
RUN apt install python3-pip -y && python3.7 -m pip install -U pip setuptools
RUN python3.7 -m pip install -U markupsafe && python3.7 -m pip install -U pip setuptools
RUN python3.7 -m pip install -U markupsafe
RUN python3.7 -m pip install -U checkov
RUN echo "checkov version is " && checkov -v
