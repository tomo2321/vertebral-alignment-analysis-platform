FROM tensorflow/tensorflow:1.15.0-gpu-py3
LABEL maintainer="tomoki-h <hakotani.tomoki.hr4@is.naist.jp>"

WORKDIR /ws
COPY Dockerfile requirements.txt /ws/
COPY volume-renderer-master/requirements.txt /ws/volume-renderer-master/

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC && \
  apt update && \
  apt install -y --no-install-recommends libgl1-mesa-dev xvfb && \
  python -m pip install -U pip && \
  python -m pip install -r /ws/requirements.txt

CMD ["/bin/bash"]

