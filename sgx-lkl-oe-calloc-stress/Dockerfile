FROM haohua/llvm-toolchain-strongbox

RUN apk add --no-cache libstdc++ musl-dev 
ADD *.c /
RUN clang -DPAGES_COUNT=512000 -g -o heapstress calloc_stress.c

