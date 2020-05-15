# ActionCable-Anycable-Benchmark

## Setup

```bash
RAILS_ENV=production bin/setup
RAILS_ENV=production bundle exec rails assets:precompile
curl -Lo bin/anycable-go https://github.com/anycable/anycable-go/releases/download/v0.6.0/anycable-go-v0.6.0-linux-amd64 && \
  chmod +x bin/anycable-go
```

## Start the bench application

[`Foreman`](https://github.com/ddollar/foreman) is used in order to ease processes management with Procfiles.

### Start with ActionCable as Websocket server

```bash
foreman start -e .env.production,.env.actioncable -f Procfile.actioncable
```

### Start with AnyCable as Websocket server

```bash
foreman start -e .env.production,.env.anycable -f Procfile.anycable
```

### Start with Iodine as Websocket server

```bash
foreman start -e .env.production,.env.actioncable_iodine -f Procfile.actioncable_iodine
```

## Start the test suite

```bash
tsung -f tsung.xml -k start
```
