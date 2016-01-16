[![Circle CI](https://circleci.com/gh/Soliah/chef-syslog-ng.svg?style=svg)](https://circleci.com/gh/Soliah/chef-syslog-ng)

# chef-syslog-ng

Setup `syslog-ng` on Ubuntu and Debian

## Requirements

Only tested to be working on the following Ubuntu versions below, but may work on earlier versions too.

- Ubuntu 14.04

## Attributes

None

## LWRP

### syslog_ng_papertrail_dest

### syslog_ng_papertrail_file_log

### syslog_ng_papertrail_program_log

## Usage

Just include `syslog-ng` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[syslog-ng]"
  ]
}
```
