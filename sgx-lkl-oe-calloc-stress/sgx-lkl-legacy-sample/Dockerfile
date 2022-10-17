FROM alpine:3.16

RUN apk add musl-dev build-base gcc bash

ADD calloc_stress.c . 
RUN gcc -DPAGES_COUNT=8192 calloc_stress.c -o heapstress
