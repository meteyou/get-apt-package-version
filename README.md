# Get APT Package version

This is a Github Action to find a candidate APT package version in Ubuntu/Debian systems.

## Why

You want to create an Ubuntu/Debian-based container image for some package,
which already exists in an APT repository (either in the official repos,
or some third party PPA repo).

You can use this Action to find the latest version of that package that is
applicable to your Ubuntu/Debian base image version,
so that you can tag the image accordingly.

## Example Workflow

```yaml
on: [push]

jobs:
  run:
    name: Get Nextcloud version on PPA
    runs-on: ubuntu-latest
    steps:
      - name: Get version
        id: get_version
        uses: dangmai/get-apt-package-version@v1.0.0
        with:
          ppa: nextcloud-devs/client
          package: nextcloud-desktop
          baseImage: ubuntu:focal

      - name: Print version
        run: echo "${{ steps.get_version.outputs.version }}"
```
