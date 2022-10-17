SGXLKL_STARTER=/home/nelly/sgx-lkl/build/sgx-lkl-run

# ---------------------------------------------------
PROG_NAME=heapstress
# ---------------------------------------------------
IMG_NAME=haohua-test/$(PROG_NAME)
ROOT_FS=$(PROG_NAME).img
ALPINE_TAR=$(PROG_NAME).tar.gz
ALPINE_CONTAINER_CID=$(PROG_NAME).cid
MOUNTPOINT=/media/ext4disk

IMAGE_SIZE_MB=1000

all: $(ROOT_FS)
	
# create a container and get its id 
$(ALPINE_CONTAINER_CID) : Dockerfile 
	rm -f $(ALPINE_CONTAINER_CID)
	@echo "Building Docker image..."
	docker build --rm=true -t $(IMG_NAME) .
	docker run --cidfile $(ALPINE_CONTAINER_CID) -d $(IMG_NAME) bash 

# cat tar based on the cotainer 
$(ALPINE_TAR) : $(ALPINE_CONTAINER_CID)
	docker export -o $(ALPINE_TAR) $(shell cat $(ALPINE_CONTAINER_CID))

# extract the files from the container, and put them to a disk image (ext4)
$(ROOT_FS) : $(ALPINE_TAR)
	dd if=/dev/zero of="${ROOT_FS}" count=$(IMAGE_SIZE_MB) bs=1M
	mkfs.ext4 $(ROOT_FS)
	mkdir -p $(MOUNTPOINT)
	mount -t ext4 -o loop $(ROOT_FS) $(MOUNTPOINT)
	tar -C $(MOUNTPOINT) -xvf $(ALPINE_TAR)
	umount $(MOUNTPOINT)
	chown $(USER) "$(ROOT_FS)"

test: run

run: run-hw 

# SGXLKL_CMDLINE="-mem=500mb"
# SGXLKL_OE_HEAP_PAGE_COUNT=100000

run-hw: ${ROOT_FS}
	SGXLKL_HEAP=700M SGXLKL_KEY=../../build/config/enclave_debug.key $(SGXLKL_STARTER) $(ROOT_FS) /heapstress

# ----------------------------------------------------------------
clean:
	rm -f $(ROOT_FS) $(ALPINE_CONTAINER_CID) $(ALPINE_TAR)
