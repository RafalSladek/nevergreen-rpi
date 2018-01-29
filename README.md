# nevergreen-rpi
nevegreen docker container for raspberry pi

### Running

To run latest version of container with default AES key
```
docker run -d -p [host-port]:5000 rafalsladek/nevergreen-rpi
```

To run latest version of container with your AES key
```
docker run -d -p [host-port]:5000 -e "AES_KEY=[your-key]" rafalsladek/nevergreen-rpi
```

### How to generate AES_KEY

If you are using authentication with your CI server, it is strongly recommended to override the default AES key that Nevergreen uses to encrypt your passwords. The password must be 16bits and you can 
```
openssl rand -base64 29 | tr -d "=+/" | cut -c1-16
```
, ensure it is 16 characters with no special characters.

### Quick start
```
docker run -d -p 5000:5000 -e "AES_KEY=$(openssl rand -base64 29 | tr -d "=+/" | cut -c1-16)" --name nevergreen-rpi --restart unless-stopped rafalsladek/nevergreen-rpi:latest
```

### How to change restart policy of existing docker container. It will re-start nevergreen container if it stops (https://docs.docker.com/engine/admin/start-containers-automatically/#use-a-restart-policy). 

```
docker update --restart=always nevergreen-rpi
```
### Log rotation
Docker produce logs pro container. To avoid that your sd card runs out of free memory, you need to delete the logs or setup an log rotation

1. create file ```/etc/logrotate.d/docker-container```
2. paste this into this file
```
/var/lib/docker/containers/*/*.log {
  rotate 7
  daily
  compress
  size=1M
  missingok
  delaycompress
  copytruncate
}
```
