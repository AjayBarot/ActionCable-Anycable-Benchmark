# ActionCable-Anycable-Benchmark

## Summary

This application shows the difference between actioncable and anycable results in websocket programming.

## Key findings
1. Anycable is better than actioncable when its comes to performance and memory allocation.
2. Actioncable with iodine is better than actioncable in performance and memory allocation (but not good as anycable).
3. Tsung is a load testing tool. It provides functionality to load the app with simultaneous user connection. It is developed in Erlang. Please gone through tsung.xml for input file.

## limitations
1. Actioncable 20k concurrent requests take 3.5 GB memory.
2. Anycable 20k cocurrent requests take 800 MB memory.

## Anycable

![architecture](https://docs.anycable.io/assets/images/scheme_invert.png)

## Comparison between the Options

| **Features** | **Actioncable** | **Anycable** | **Actioncable with Iodine** |
| ------------ | ------------- | ------------------ | ---------- |
| **Compatibility** | Compatible for Ruby >= 2.2.2 | Compatible for Ruby > 2.5 | Compatible for Ruby >= 2.2.2 |
| **Performance** | 20k idle clients == 3.5 GB memory RAM usage | 20k idle clients == 800 MB memory RAM usage | 20k idle clients == 1.5 GB memory RAM usage |
| **Deployment** | fayesocket as websocket server | anycable-go as websocket server | iodine as websocket server |
| **Simplicity of use** | Easy to debug and use | we need to debug into gRPC server|  |
| **Github link**| https://github.com/rails/rails/tree/master/actioncable | https://github.com/anycable/anycable-rails | https://github.com/boazsegev/iodine |

## Setup to run the app

```bash
RAILS_ENV=production bin/setup
RAILS_ENV=production bundle exec rails assets:precompile
curl -Lo bin/anycable-go https://github.com/anycable/anycable-go/releases/download/v0.6.0/anycable-go-v0.6.0-linux-amd64 && \
  chmod +x bin/anycable-go
```

## Tsung setup for MAC OS 10+
1. ``` brew install tsung ```.
2. ``` sudo cpan Template ```.
3. For ubuntu please refer this link [`ubuntu tsung`](http://www.madhankarthik.in/to-install-the-tsung-on-the-ubuntu/)
4. To increase file limits refer this link [`file-limits`](https://github.com/hashrocket/websocket-shootout#open-file-limits)

## Common problem while setup
1. ActiveSupport::MessageEncryptor::InvalidMessage error 
  - Please remove config/master.key credentials.yml.enc
  - Execute EDITOR="mate --wait" bin/rails credentials:edit
2. Tsung is not working.
  - Make sure you have set the limit of file descriptors as per your machine OS.

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

This will run runtime reporting on localhost:8091

## Reference
1. https://docs.anycable.io/v06/#/
2. https://anycable.io/
3. https://github.com/anycable/anycable-rails
4. https://www.thegreatcodeadventure.com/load-testing-rails-5-action-cable-with-tsung/
5. https://nebulab.it/blog/actioncable-vs-anycable-fight/
6. https://www.youtube.com/watch?v=0cKtKxKzu68
7. https://www.slideshare.net/TokyoIncidents/what-is-rack-hijacking-api-69807904
8. https://github.com/boazsegev/iodine
9. https://medium.com/@plezi_io/how-actioncable-broke-puma-fcfeceac33b0

## Notes
1. Make sure your socket connection is working with anycable(cable.yml).
2. Benchmarking reporting is done with single threaded development machine It may vary in production.