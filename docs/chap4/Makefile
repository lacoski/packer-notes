.PHONY: build clean

build:
	rm -rf output-jammy reports
	mkdir -p reports/repo
	packer init .
	packer build .

clean:
	rm -rf output-jammy reports
