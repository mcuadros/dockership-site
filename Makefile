# Environment
BASE_PATH := $(shell pwd)
DOCKERSHIP_PATH := $(DOCKERSHIP_PATH)/tmp/dockership

# Rules
all: build

build: clean
	git clone https://github.com/mcuadros/dockership.git $(DOCKERSHIP_PATH)
	cp -rf $(DOCKERSHIP_PATH)/documentation/* $(BASE_PATH)/content/documentation/
	hugo

server: build
	hugo server

clean:
	rm -rf $(DOCKERSHIP_PATH)

publish: build
	git add -A
	git commit -m "Updating site" && git push origin master
	git subtree push --prefix=public git@github.com:mcuadros/dockership-site.git gh-pages

