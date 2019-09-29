all: build push manifest clean
build:
	sh get-qemu.sh
	docker build -f Dockerfile -t omnidapps/go-tools:latest .
	docker build -f Dockerfile.arm -t omnidapps/go-tools:latest-arm .
manifest:
	docker manifest create --amend omnidapps/go-tools:latest omnidapps/go-tools:latest omnidapps/go-tools:latest-arm
	docker manifest annotate omnidapps/go-tools:latest omnidapps/go-tools:latest --arch amd64 --os linux
	docker manifest annotate omnidapps/go-tools:latest omnidapps/go-tools:latest-arm --arch arm --os linux
	docker manifest push omnidapps/go-tools:latest
push:
	docker login
	docker push omnidapps/go-tools:latest
	docker push omnidapps/go-tools:latest-arm
clean:
	rm -rf qemu*
