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
5. [Limitations](#limitations)
6. [Development](#development)

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
* **history**: how many days log files will be kept (default: 60)

## Limitations

* Redhat and derivatives: releases 5, 6 and 7.
* Ubuntu: 14
* Other: Not supported.
