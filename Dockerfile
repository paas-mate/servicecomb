FROM shoothzj/compile:go AS compiler

WORKDIR /opt

RUN git clone --depth 1 https://github.com/apache/servicecomb-service-center && \
cd servicecomb-service-center && \
go build -o service-center github.com/apache/servicecomb-service-center/cmd/scserver

FROM shoothzj/base

ENV SERVICECOMB_HOME /opt/servicecomb

COPY --from=compiler /opt/servicecomb-service-center/service-center /opt/servicecomb/service-center

WORKDIR /opt/servicecomb
