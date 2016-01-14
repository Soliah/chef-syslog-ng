[![Circle CI](https://circleci.com/gh/Soliah/chef-syslog-ng.svg?style=svg)](https://circleci.com/gh/Soliah/chef-syslog-ng)

# chef-syslog-ng

Setup `syslog-ng` on Ubuntu and Debian

## Requirements

Only tested to be working on the following Ubuntu and Debian versions below, but may work on earlier versions too.

- Ubuntu 14.04
- Ubuntu 12.04
- Debian 8.2
- Debian 8.1
- Debian 8.0

## Attributes

None

## LWRP

## Usage

Just include `syslog-ng` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[syslog-ng]"
  ]
}
```
