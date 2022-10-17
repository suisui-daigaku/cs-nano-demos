FROM alpine:3.16

RUN apk add musl-dev build-base gcc

ADD calloc_stress.c . 
RUN gcc calloc_stress.c -o heapstress
