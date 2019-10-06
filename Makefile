all: build push manifest clean
build:
	sh get-qemu.sh
	docker build -f Dockerfile -t omnidapps/go-tools:linux-amd64 .
	docker build -f Dockerfile.arm -t omnidapps/go-tools:linux-arm .
manifest:
	docker manifest create --amend omnidapps/go-tools:latest omnidapps/go-tools:linux-amd64 omnidapps/go-tools:linux-arm
	docker manifest annotate omnidapps/go-tools:latest omnidapps/go-tools:linux-amd64 --arch amd64 --os linux
	docker manifest annotate omnidapps/go-tools:latest omnidapps/go-tools:linux-arm --arch arm --os linux
	docker manifest push --purge omnidapps/go-tools:latest
push:
	docker login
	docker push omnidapps/go-tools
clean:
	rm -rf qemu*
