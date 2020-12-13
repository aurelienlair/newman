# Newman

This project is a containerized version of [Newman](https://learning.postman.com/docs/running-collections/using-newman-cli/command-line-integration-with-newman/).


## Getting Started

These instructions will allow you to run Newman your local machine for example for development and testing purposes.

### Prerequisites

- Docker
If you will follow the set-up with Docker (see below) then install last [Docker](https://www.docker.com/community-edition) for your specific OS.

### Installing

#### Docker

From the root of the project
```shell
cd <YOUR_PROJECT_ROOT_DIRECTORY>
docker pull aurelienlair/newman:1.0.0
docker build -t newman:1.0.0 --force-rm .
drun -v (pwd)/YOUR_COLLECTION.json:/opt/newman/src/config/collection.json newman:1.0.0
```

### Distro
the remote container is [Node Alpine](https://hub.docker.com/_/node) based.


## Conventions

### Git commit message convention

#### Format:

`<type>(<scope>): <subject>`

| Type | Description |
|------| ----------- |
| `style` | Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc) |
| `chore` | Changes to the build process or auxiliary tools and libraries such as documentation generation |
| `docs` | Documentation Updates |
| `feat` | New Features |
| `fix`  | Bug Fixes |
| `refactor` | Code Refactoring |
| `test` | Adding missing tests |
| `perf` | A code change that improves performance |