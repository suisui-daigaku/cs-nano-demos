SGXLKL_STARTER=../../build/sgx-lkl-run-oe

EXECUTION_TIMEOUT=12000
SGXLKL_ENV=SGXLKL_VERBOSE=1 SGXLKL_KERNEL_VERBOSE=1
SGXLKL_HW_PARAMS=--hw-debug

# ---------------------------------------------------
PROG_NAME=heapstress
# ---------------------------------------------------
IMG_NAME=randoruf-test/$(PROG_NAME)
ROOT_FS=$(PROG_NAME).img
ALPINE_TAR=$(PROG_NAME).tar.gz
ALPINE_CONTAINER_CID=$(PROG_NAME).cid
MOUNTPOINT=/media/ext4disk
ENTRY_PROG=/$(PROG_NAME)

IMAGE_SIZE_MB=1000

all: $(ROOT_FS)

gettimeout:
	@echo ${EXECUTION_TIMEOUT}
	
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

run: run-hw 

############### 
# SGXLKL_CMDLINE="-mem=128mb"   			to mimic a computer which has 1 GB memory (note that a thread must have at most 4GB) (EPC is 8 GB, SGX-LKL itsefl 1G,  there are 6 GB left as the disk) 
# ----------------------------------- 
# SGXLKL_STACK_SIZE=8388608					each thread should have at least 8 mb (Linux application)
# -----------------------------------       
# SGXLKL_OE_HEAP_PAGE_COUNT=100000			
###############

run-hw: ${ROOT_FS}
	SGXLKL_STACK_SIZE=8388608 SGXLKL_CMDLINE="-mem=128mb" SGXLKL_TRACE_MMAP=1 SGXLKL_ETHREADS=1 $(SGXLKL_STARTER) $(SGXLKL_HW_PARAMS) $(ROOT_FS) /heapstress

# ----------------------------------------------------------------
clean:
	rm -f $(ROOT_FS) $(ALPINE_CONTAINER_CID) $(ALPINE_TAR)
