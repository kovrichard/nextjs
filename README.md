# Docker image for Next.js development

## What is this image

This image can be used for developing Next.js applications in a containerized local environment.

Contents:
- npm 8.19.2
- Node.js 16.18.1
- Yarn 1.22.19
- Next.js 13.0.7
- Alpine 3.15

## How to use this image

```
FROM richardkovacs/nextjs:13
```

Available on the Docker Hub: [nextjs](https://hub.docker.com/r/richardkovacs/nextjs)

### Mounting a directory

Your application should be mounted to `/usr/src/app/`.

When you mount your directory, don't forget to add the following three files/directories as well:

- [`next.config.js`](/next.config.js): It contains a command to make Fast Refresh work even inside a container. If you mount your directory without this file, it will override the basic structure of the image, i.e. removes the config.
- [`package.json`](/package.json): Contains the basic dependencies needed by the image. They are already installed, but you need the file for the scripts.
- [`pages`](/pages/) folder: your pages should be inside this directory, and it is needed by Next.js. You may put anything you like inside it, but the folder is required.

### Usage with Docker Compose

An example `docker-compose.yml` could be something like this:

```
version: '3'
services:
  nextjs:
    image: nextjs
    build: ./
    working_dir: /usr/src/app
    volumes:
      - ./:/usr/src/app/
      - /usr/src/app/node_modules
      - /usr/src/app/.next
    ports:
      - 3000:3000
    command: npm run dev
```

A `Dockerfile` is also needed in this case:

```
FROM richardkovacs/nextjs:13

# npm i
```

If you would like to install additional Node dependencies, open a shell inside the container with

```
docker compose run --rm nextjs /bin/sh
```
and then add your dependencies with e.g. `npm add <dependency>`. Uncomment `npm i` at the end of the `Dockerfile` to install them at each build into the image.

## License

This repository is licensed under the MIT license.

However, each software installed in the image has its own license.

It is the image user's responsibility to ensure that any use of this image complies with any relevant licenses.

## Author

Richard Kovacs

- [GitHub](https://github.com/kovrichard)
- [Twitter](https://twitter.com/rchardkovacs)
