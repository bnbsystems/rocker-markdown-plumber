
# rocker-markdown-plumber
Cointains `rmarkdown` and `pandoc`

## How to run it?
```sh
docker run --rm -p 8000:8000 bnbsystems/rocker-markdown-plumber:latest
```


# rocker-pdf-api
For generating pdf via REST api


## How to run it?
```sh
docker run --rm -p 8000:8000 bnbsystems/rocker-pdf-api:latest
```


## How to test it?
```sh
curl --data '{"id":4}' -X POST "http://127.0.0.1:8000/pdf"
``` 

## What if you have your own plumber file

```sh
docker run --rm -p 8000:8000 -v `pwd`:/pwd bnbsystems/rocker-pdf-api:latest /pwd/plumber.R
```

# Building docker files

## How to build
``` sh
make build
```

## How to test it
``` sh
make test
```



