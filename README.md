# hugo

Docker Image for building static website using [hugo](https://gohugo.io)

## Usage

### Via the command line

```bash
docker run --rm \
	registry.gitlab.com/graemer957/hugo \
	<command>
```

For example, I wanted to write a new test my site locally:

```bash
docker run --rm \
	-v $PWD:/site \
	-w /site \
	-p 1313:1313 \
	registry.gitlab.com/graemer957/hugo \
	-b http://localhost server --bind 0.0.0.0
```

### As part of a build process using a `Dockerfile`

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
