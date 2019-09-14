# Heroku Circle CI Orbs

* [Heroku/golang](https://circleci.com/orbs/registry/orb/heroku/golang)
* [Heroku/snyk](https://circleci.com/orbs/registry/orb/heroku/snyk)

## Development

Each directory in the `src/` directory contains the source structure for the corresponding orb.
The directories require [packing](https://circleci.com/docs/2.0/creating-orbs/#packing-a-config) into final orbs.

Example: `src/golang` contains the source for the heroku/golang orb.

### Validating an orb

While hacking on an orb you will want to validate it every so often. The Makefile target `validate` will pack the
orb for you and validate the resulting file.

```console
make validate ORB=<orb name>
```

### Publishing an orb

After hacking on an orb it needs to be published. The Makefile target `publish` can do this for you.
Before publishing it will pack and validate the orb for you.
It will also tag the repo with a tag structured like so: `$ORB-v$VERSION`

```console
make publish VERSION=<version> ORB=<orb_name>
```

## Creating a new orb

The Makefile has a `new` target that will register a new orb with circleci, under the heroku namespace, create the basic structure,
and validate the new orb.

NOTE: registering a new orb with circleci can't be undone, so don't use this unless you really want to.

```console
make new ORB=<ORB NAME>
```
