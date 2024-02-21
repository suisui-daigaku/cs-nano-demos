

image: 
	docker build -t "mmap_lab" .
	
run:
	docker run -it --rm --mount type=bind,source=$(shell pwd),target="/home/cpu_affinity_lab" --entrypoint /bin/sh "mmap_lab"