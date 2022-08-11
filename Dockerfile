FROM ttbb/base:goc AS compiler

RUN git clone --depth 1 https://github.com/apache/servicecomb-service-center && \
cd servicecomb-service-center && \
go build -o service-center github.com/apache/servicecomb-service-center/cmd/scserver

FROM ttbb/base

ENV SERVICECOMB_HOME /opt/sh/servicecomb

COPY --from=compiler /opt/sh/servicecomb-service-center/service-center /opt/sh/servicecomb/service-center

WORKDIR /opt/sh/servicecomb
