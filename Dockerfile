FROM rust:1.93-slim as builder

WORKDIR /usr/src/

COPY . .

RUN cargo build --release

FROM debian:bookworm-slim

WORKDIR /usr/app

COPY --from=builder /usr/src/. /usr/app/.

ENTRYPOINT ["/usr/app/target/release/stremio_youtube_manager-cli"]