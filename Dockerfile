FROM rust:1.30

ENV LOCAL_POST 2000

RUN mkdir /ptunnel
WORKDIR /ptunnel
RUN wget -O ptunnel.tar.gz "https://github.com/izderadicka/ptunnel-rust/archive/master.tar.gz"; \
    tar -xvf ptunnel.tar.gz; \
    rm ptunnel.tar.gz
WORKDIR /ptunnel/ptunnel-rust-master
RUN cargo build --release

EXPOSE 2000
CMD ["sh", "-c", "target/release/ptunnel $OPTIONS $LOCAL_POST:$REMOTE_HOST:$REMOTE_PORT"]
