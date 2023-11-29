# syntax=docker/dockerfile:1

FROM continuumio/miniconda3:latest
COPY ./database /rl_tf/database/
COPY ./pgportfolio /rl_tf/pgportfolio/
COPY ./main.py /rl_tf/
COPY ./requirements.txt /rl_tf/

RUN conda create -n pgpf python=3.5 -y

SHELL ["conda", "run", "--no-capture-output", "-n", "pgpf", "/bin/bash", "-c"]

RUN conda install --file rl_tf/requirements.txt
RUN pip install tflearn==0.3.2
RUN pip install h5py
ENTRYPOINT [ "/bin/sh" ]