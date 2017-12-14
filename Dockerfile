FROM hypriot/rpi-java

MAINTAINER Rafal Sladek <rafal.sladek@thoughtworks.com>

# Get the latest release
RUN wget $( curl https://api.github.com/repos/build-canaries/nevergreen/releases/latest | grep browser_download_url | head -n 1 | cut -d '"' -f 4 )

EXPOSE 5000

CMD ["java", "-jar", "nevergreen-standalone.jar"]
