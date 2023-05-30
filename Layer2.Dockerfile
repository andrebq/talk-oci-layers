FROM talk-docker-layers:layer1

RUN echo "layer 2" > /var/layers/last-layer
RUN echo "layer 2" > /var/layers/layer2
