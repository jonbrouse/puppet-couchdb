# couchdb module for puppet

This module manages couchdb on Linux (RedHat/Debian) distros.

## Dependencies

This module requires [metcalfc/rpmrepos](https://forge.puppetlabs.com/metcalfc/rpmrepos)

To install the module with its required dependencies issue the following: puppet module install jonbrouse/couchdb

## Description

This module installs couchdb and populates local.ini.erb with the defaults set in couchdb::params

## Usage

### couchdb
Installs the couchdb package.

    class { 'couchdb': }

