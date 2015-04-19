FROM google/golang:1.3

RUN go get -v github.com/spf13/hugo
RUN git clone https://github.com/mcuadros/dockership-site.git /tmp/dockership-site && echo $DOCKERSHIP_REV
RUN git clone https://github.com/mcuadros/dockership.git /tmp/dockership && echo $DOCKERSHIP_REV
RUN cp -rf /tmp/dockership/documentation/* /tmp/dockership-site/content/documentation/

EXPOSE 1313

WORKDIR /tmp/dockership-site
ENTRYPOINT ["hugo", "server"]
