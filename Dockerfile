# -*-

FROM cwedgwood/bldr:0.01

RUN mkdir -p /build/
WORKDIR /build/
COPY *.s Makefile ./
RUN make all

FROM scratch
COPY --from=0 /build/hw32 /build/hw64 /

CMD [ "/hw32" ]
