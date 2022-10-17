FROM alpine:3.16

RUN apk add --no-cache build-base musl-dev
ADD *.c /
RUN gcc -DPAGES_COUNT=512000 -g -o heapstress calloc_stress.c

