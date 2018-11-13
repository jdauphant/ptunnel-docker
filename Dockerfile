FROM rust:1.30

RUN mkdir /ptunnel
WORKDIR /ptunnel
RUN wget -O ptunnel.tar.gz "https://github.com/izderadicka/ptunnel-rust/archive/master.tar.gz"; \
    tar -xvf ptunnel.tar.gz;
    rm ptunnel.tar.gz
WORKDIR /ptunnel/ptunnel-rust-master
RUN cargo build --release

CMD CMD ["sh", "-c", "target/release/ptunnel -p $HTTPS_PROXY $PTUNNEL_TUNNEL"]
