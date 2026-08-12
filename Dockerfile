FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends bash ca-certificates curl bzip2 \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -b -p /opt/conda \
    && rm /tmp/miniconda.sh

RUN conda create -y -n vdj-runtime python=3.11 pip \
    && conda clean -afy

ENV PATH=/opt/conda/envs/vdj-runtime/bin:/opt/conda/bin:$PATH

RUN conda run -n vdj-runtime python -m pip install --no-cache-dir --upgrade pip setuptools wheel \
    && conda run -n vdj-runtime python -m pip install --no-cache-dir vdj-insights==0.1.0

WORKDIR /work

ENTRYPOINT ["vdj-insights"]
CMD ["--help"]
