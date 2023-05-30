FROM talk-docker-layers:base-layer

RUN echo "layer 1" > /var/layers/last-layer
RUN echo "layer 1" > /var/layers/layer1
