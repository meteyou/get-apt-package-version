# Get APT Package version

This is a Github Action to find a candidate APT package version in Ubuntu/Debian systems.

## How to use

```yaml
uses: dangmai/get-apt-package-version@main
with:
  ppa: "nextcloud-devs/client"
  package: "nextcloud-desktop"
  baseImage: "ubuntu:focal"
```
