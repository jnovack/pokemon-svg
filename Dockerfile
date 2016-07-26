FROM mhart/alpine-node:5

RUN mkdir /in && mkdir /out

VOLUME ["/in"]
VOLUME ["/out"]

# Instal SVGExport, remove temporary directories and non-docker version of phantomjs
RUN npm install -g svgexport \
	&& rm -rf /tmp/* \
	&& rm -rf /usr/lib/node_modules/svgexport/node_modules/phantomjs-prebuilt/lib/phantom/bin/phantomjs

# Install dockerized version of phantomjs
RUN apk update curl && apk add curl \
    && curl -Ls https://github.com/fgrehm/docker-phantomjs2/releases/download/v2.0.0-20150722/dockerized-phantomjs.tar.gz \
       | tar xz -C / \
    && apk del curl \
	&& ln -s /usr/local/bin/phantomjs /usr/lib/node_modules/svgexport/node_modules/phantomjs-prebuilt/lib/phantom/bin/phantomjs

CMD ["/usr/bin/svgexport"]
