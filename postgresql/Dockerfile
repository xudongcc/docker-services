ARG PG_VERSION=18
ARG PG_JIEBA_VERSION=2.0.1
ARG PG_VECTOR_VERSION=0.8.1

FROM postgres:${PG_VERSION}

ARG PG_VERSION
ARG PG_JIEBA_VERSION
ARG PG_VECTOR_VERSION

# Install build dependencies
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        cmake \
        git \
        postgresql-server-dev-${PG_VERSION}

# Install pg_jieba
RUN git clone --depth 1 --branch v${PG_JIEBA_VERSION} https://github.com/jaiminpan/pg_jieba.git /tmp/pg_jieba && \
    cd /tmp/pg_jieba && \
    git submodule update --init --recursive && \
    mkdir build && \
    cd build && \
    cmake -DPostgreSQL_TYPE_INCLUDE_DIR=/usr/include/postgresql/${PG_VERSION}/server .. && \
    make && \
    make install && \
    cd / && \
    rm -rf /tmp/pg_jieba

# Install pgvector
RUN git clone --depth 1 --branch v${PG_VECTOR_VERSION} https://github.com/pgvector/pgvector.git /tmp/pgvector && \
cd /tmp/pgvector && \
make && \
make install && \
cd / && \
rm -rf /tmp/pgvector
