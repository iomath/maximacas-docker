
build:
	docker build -t santiago/maximacas .

run:
	docker run --security-opt seccomp=unconfined --rm -it -v $(PWD)/output-dir:/output-dir santiago/maximacas 
