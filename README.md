# Newman

This project is a containerized version of [Newman](https://learning.postman.com/docs/running-collections/using-newman-cli/command-line-integration-with-newman/).


## Getting Started

These instructions will allow you to run Newman your local machine for example for development and testing purposes.

### Prerequisites

- Docker
If you will follow the set-up with Docker (see below) then install last [Docker](https://www.docker.com/community-edition) for your specific OS.

### Installing

#### Docker

From the root of the project build it (only once). If needed change version of the package accordingly (eg. newman:X.X.X)
```shell
cd <YOUR_PROJECT_ROOT_DIRECTORY>
docker pull aurelienlair/newman:1.1.0
docker build -t newman:1.1.0 --force-rm .
```

Then run it from remote image
```shell
docker run -t -v PATH_TO_YOUR_PROJECT/src/config:/opt/newman/src/config --rm aurelienlair/newman:1.1.0
```
or to run it locally

```shell
docker build -t local-newman --force-rm .
docker run -t -v PATH_TO_YOUR_PROJECT/src/config:/opt/newman/src/config --rm local-newman
```

Example of output
```
Musement APIs

❏ Purchase flow with an activity with extra customer data
↳ 1 - Get activity
  GET https://api-sandbox.musement.com/api/v3/activities/102ab02b-2046-11e7-9cc9-06a7e332783f [200 OK, 18.17KB, 508ms]
  ✓  Check http status code

↳ 2 - Get date activity
  GET https://api-sandbox.musement.com/api/v3/activities/102ab02b-2046-11e7-9cc9-06a7e332783f/dates [200 OK, 167.84KB, 307ms]
  ✓  Check http status code

↳ 3 - Get schedule first day available
  GET https://api-sandbox.musement.com/api/v3/activities/102ab02b-2046-11e7-9cc9-06a7e332783f/dates/2020-12-25 [200 OK, 15.92KB, 160ms]
  ✓  Check http status code

↳ 4 - Create Cart
  POST https://api-sandbox.musement.com/api/v3/carts [200 OK, 1.47KB, 140ms]
  ✓  Check http status code

↳ 5 - Add 2 adults on Musement product to cart
  POST https://api-sandbox.musement.com/api/v3/carts/ed2daff6-2f5c-48b4-9c48-d804cfa06875/items [200 OK, 2.3KB, 173ms]
  ✓  Check http status code

↳ 6 - Set customer to cart
  PUT https://api-sandbox.musement.com/api/v3/carts/ed2daff6-2f5c-48b4-9c48-d804cfa06875/customer [200 OK, 918B, 161ms]
  ✓  Check http status code

↳ 7 - Get cart | For checking
  GET https://api-sandbox.musement.com/api/v3/carts/ed2daff6-2f5c-48b4-9c48-d804cfa06875 [200 OK, 3.28KB, 255ms]
  ✓  Check http status code

↳ 8 - Create Order
  POST https://api-sandbox.musement.com/api/v3/orders [200 OK, 3.75KB, 936ms]
  ✓  Check http status code

↳ 9 - Pay the order with Stripe
  POST https://ebd289e0-53ea-44a8-aa03-f32e58a78eb4.mock.pstmn.io/payments/stripe/payment [200 OK, 567B, 683ms]
  ✓  Check http status code

┌─────────────────────────┬─────────────────────┬────────────────────┐
│                         │            executed │             failed │
├─────────────────────────┼─────────────────────┼────────────────────┤
│              iterations │                   1 │                  0 │
├─────────────────────────┼─────────────────────┼────────────────────┤
│                requests │                   9 │                  0 │
├─────────────────────────┼─────────────────────┼────────────────────┤
│            test-scripts │                  27 │                  0 │
├─────────────────────────┼─────────────────────┼────────────────────┤
│      prerequest-scripts │                  25 │                  0 │
├─────────────────────────┼─────────────────────┼────────────────────┤
│              assertions │                   9 │                  0 │
├─────────────────────────┴─────────────────────┴────────────────────┤
│ total run duration: 4s                                             │
├────────────────────────────────────────────────────────────────────┤
│ total data received: 208.04KB (approx)                             │
├────────────────────────────────────────────────────────────────────┤
│ average response time: 369ms [min: 140ms, max: 936ms, s.d.: 265ms] │
└────────────────────────────────────────────────────────────────────┘
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