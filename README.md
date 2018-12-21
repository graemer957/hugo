# hugo

Docker Image for building static website using [hugo](https://gohugo.io)

## Usage

Create a `Dockerfile` with the following contents:

```yml
# Build website using Hugo
FROM registry.gitlab.com/graemer957/hugo AS builder

WORKDIR /site
COPY . .
RUN hugo

# Use nginx for serving
FROM nginx:1.14.2-alpine

# Website content
COPY --from=builder /site/public/ /usr/share/nginx/html/
```

This should just work as is™, but I would recommend customising your `nginx.conf` file from the default.