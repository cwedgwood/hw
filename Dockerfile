# -*-

FROM cwedgwood/bldr:0.04

RUN mkdir -p /build/
WORKDIR /build/
COPY *.s Makefile ./
RUN make hw32

FROM scratch
COPY --from=0 /build/hw32 /

CMD [ "/hw32" ]
