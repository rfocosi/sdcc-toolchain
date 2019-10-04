FROM debian:bullseye
MAINTAINER Roberto Focosi, roberto.focosi@msx2cas.com

ENV TOOLCHAIN_VERSION=1.3

ENV WORKSPACE_ROOT=/workspace

ENV SRC_PATH=${WORKSPACE_ROOT}/src
ENV BUILD_PATH=$WORKSPACE_ROOT/build
ENV TARGET_PATH=$WORKSPACE_ROOT/target

ARG SDCC_LIB_MAIN_PATH=/usr/share/sdcc

RUN apt-get update && apt-get install -y sdcc gettext-base binutils bsdmainutils

ENV SDCC_INCLUDE_MAIN=${SDCC_LIB_MAIN_PATH}/include
ENV SDCC_LIB_MAIN=${SDCC_LIB_MAIN_PATH}/lib
ENV SDCC_LIB=/extra-lib
ENV SDCC_INCLUDE=/extra-include

RUN mkdir -p $SDCC_LIB && \
    mkdir -p $SDCC_INCLUDE && \
    mkdir -p $SRC_PATH

ADD bin/* /usr/local/bin/

RUN chmod +x /usr/local/bin/build && \
    chmod +x /usr/local/bin/clean && \
    chmod +x /usr/local/bin/info && \
    chmod +x /usr/local/bin/sdasm && \
    rm -rf /tmp/*

WORKDIR ${WORKSPACE_ROOT}

CMD ["info"]
