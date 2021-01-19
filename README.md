# rocker-markdown-plumber


## How to run it?
```sh
docker run --rm -p 8000:8000 -v `pwd`:/pwd bnbsystems/rocker-markdown-plumber:latest /pwd/plumber.R
```
## How to test it?
```sh
curl --data '{"id":4}' -X POST "http://127.0.0.1:8000/pdf"
``` 

## How to build
``` sh
make build
```