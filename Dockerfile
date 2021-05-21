FROM debian:bullseye

RUN apt update && apt install -y squashfs-tools