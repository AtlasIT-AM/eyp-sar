# sar

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What sar affects](#what-sar-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with sar](#beginning-with-sar)
4. [Usage](#usage)
5. [Reference](#reference)
6. [Development](#development)
    * [TODO](#todo)
    * [Contributing](#contributing)

## Overview

Installs the sar package.

## Setup

### What sar affects

* Installs sar
* Manages system's configuration file:
  * Debian based: **/etc/default/sysstat**
  * RH based: **/etc/sysconfig/sysstat**

### Beginning with sar

Standard configuration:

```puppet
class { 'sar': }
```

## Usage

change default retention:

```puppet
class { 'sar':
  history => '7',
}
```


## Reference

### classes

#### sar

main class, install the module and configure it
* **ensure**: set if the sar package will be installed or removed (default: installed)
* **enable**: set if sar is enabled or disabled (default: true)
* **history**: how many days log files will be kept (default: 30)
* **sadc_options**: (default: distro default)
* **sa_dir**: (default: distro default)
* **compress_after**: (default: distro default)
* **compress**: (default: distro default)

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some tests to check both presence and absence of any feature

### TODO

* Add more postgres versions
* tablespaces management
* Rewrite class relationships
* Improve default config: https://github.com/le0pard/pgtune/blob/master/webpack/selectors/configuration.jsç
* Move **postgresql::hba_rule** to **postgresql::hba** namespace

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
