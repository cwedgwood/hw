# -*-

FROM cwedgwood/bldr:0.01

RUN mkdir -p /build/out/
WORKDIR /build/
COPY *.s Makefile ./

ARG target=all
RUN make $target

FROM scratch
COPY --from=0 /build/out/* /

CMD [ "/run" ]
