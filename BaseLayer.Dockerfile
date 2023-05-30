FROM alpine

RUN mkdir -p /var/layers
RUN echo "Base" > /var/layers/last-layer
RUN echo "Base" > /var/layers/base
