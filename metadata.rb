name "syslog-ng"
maintainer "Christopher Chow"
maintainer_email "chris@chowie.net"
license "MIT"
description "Setup syslog-ng on Ubuntu and Debian"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version "1.0.0"

depends "apt"

supports %w(ubuntu)
