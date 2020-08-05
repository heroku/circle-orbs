# Heroku Circle CI Orbs

User documentation is available on CircleCI Orb Registry:

* [heroku/install-sfdx](https://circleci.com/orbs/registry/orb/heroku/install-sfdx)
* [heroku/golang](https://circleci.com/orbs/registry/orb/heroku/golang)
* [heroku/sfdx-auth](https://circleci.com/orbs/registry/orb/heroku/sfdx-auth)
* [heroku/sfdx-evergreen-auth](https://circleci.com/orbs/registry/orb/heroku/sfdx-evergreen-auth)
* [heroku/slack-notify-success-fail-with-data](https://circleci.com/orbs/registry/orb/heroku/slack-notify-success-fail-with-data)
* [heroku/snyk](https://circleci.com/orbs/registry/orb/heroku/snyk)
* [heroku/terraform-for-test](https://circleci.com/orbs/registry/orb/heroku/terraform-for-test)

## Development

Each directory in the `src/` directory contains the source structure for the corresponding orb.
The directories require [packing](https://circleci.com/docs/2.0/creating-orbs/#packing-a-config) into final orbs.

Example: `src/golang` contains the source for the heroku/golang orb.

### Dependencies

You will need the `circleci` cli which can be installed with `brew install circleci` on macOS or by following [CircleCI's instructions](https://circleci.com/docs/2.0/local-cli/#installation).

### Validating an orb

While hacking on an orb you will want to validate it every so often. The Makefile target `validate` will pack the
orb for you and validate the resulting file.

```console
make validate ORB=<orb name>
```

### Publishing an orb

After hacking on an orb it needs to be published. The Makefile target `publish` can do this for you.
Before publishing it will pack and validate the orb for you.

#### Dev versions

Start publishing with a `dev:*` version to create a mutable version with a 90-day lifetime.

```console
make publish VERSION=dev:prerelease-01 ORB=<orb_name>
```

#### Release versions

GitHub org owners & administrators may publish stable, immutable versions.

It will also tag the repo with a tag structured like so: `$ORB-v$VERSION`

```console
make publish VERSION=<version> ORB=<orb_name>
```

## Creating a new orb

GitHub org owners may create new orbs.

The Makefile has a `new` target that will register a new orb with circleci, under the heroku namespace, create the basic structure,
and validate the new orb.

NOTE: registering a new orb with circleci can't be undone, so don't use this unless you really want to.

```console
make new ORB=<ORB NAME>
```
