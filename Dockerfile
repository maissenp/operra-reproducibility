FROM rocker/verse:4.5.0

RUN install2.r ggplot2 dplyr kableExtra && \
    apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    openjdk-21-jre-headless \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip3 install --no-cache-dir --break-system-packages snakemake -r requirements.txt && \
    curl -s https://get.nextflow.io | bash && mv nextflow /usr/local/bin/

EXPOSE 8787
ENV USER=rstudio
CMD ["/init"]
