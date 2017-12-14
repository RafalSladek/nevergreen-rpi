FROM armv7/armhf-java8

MAINTAINER Rafal Sladek <rafal.sladek@scout24.com>

RUN wget https://github.com/build-canaries/nevergreen/releases/download/v0.10.0/nevergreen-standalone.jar

# Get the latest release
#RUN wget $( curl https://api.github.com/repos/build-canaries/nevergreen/releases/latest | grep browser_download_url | head -n 1 | cut -d '"' -f 4 )

EXPOSE 5000
ENTRYPOINT ["java", "-jar", "nevergreen-standalone.jar"]
