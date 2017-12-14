# nevergreen-rpi
nevegreen docker container for raspberry pi

### Running

To run latest version of container with default AES key
```
docker run -d -p [host-port]:5000 buildcanariesteam/nevergreen 
```

To run latest version of container with your AES key
```
docker run -d -p [host-port]:5000 -e "AES_KEY=[your-key]" buildcanariesteam/nevergreen 
```

### How to generate AES_KEY

If you are using authentication with your CI server, it is strongly recommended to override the default AES key that Nevergreen uses to encrypt your passwords. The password must be 16bits and you can 
```
openssl rand -base64 29 | tr -d "=+/" | cut -c1-16
```
, ensure it is 16 characters with no special characters.
