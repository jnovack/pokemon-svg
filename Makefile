.PHONY: build docker images all

OUT?=`pwd`
OPTS?=

build:
	docker rm -fv svgexport || true
	docker build -t svgexport .

docker:
	docker rm -fv svgexport || true
	docker run -it -d -v `pwd`/svg/:/in -v ${OUT}:/out --name svgexport svgexport /bin/sh

images:
	cd svg; /usr/bin/find . -name '*.svg' -type f -print0 | xargs -0 -I '{}' sh -c 'f="{}";d=$$(dirname $$f);echo $$f;docker exec -i svgexport /usr/bin/svgexport /in/$$f /out/$$(basename $$f .svg).png ${OPTS}'

all: build docker images
