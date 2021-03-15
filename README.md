# asdf Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/asdf.svg)](https://supermarket.chef.io/cookbooks/asdf)
[![Build Status](https://img.shields.io/circleci/project/github/asdf-chef/asdf/master.svg)](https://circleci.com/gh/asdf-chef/asdf)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

Installs and configures [asdf](https://github.com/asdf-vm/asdf) extendable version manager.

## Requirements

- Chef 14.3+

## Platforms

The following platforms are supported and tested with Test Kitchen:

- Amazon Linux 2+
- CentOS 7+
- Debian 8+
- Fedora 27+
- Ubuntu 16.04+
- openSUSE Leap

Other Debian and RHEL family distributions are assumed to work.

## Dependencies

- ark

## Usage

Place a dependency on the asdf cookbook in your cookbook's metadata.rb

```ruby
depends 'asdf'
```

Examples are provided in `test/fixtures/cookbooks/test/recipes`.

A `asdf_user_install` is required so that asdf is installed. See `Resources` below.

## Resources

- [asdf_user_install](https://github.com/asdf-chef/asdf/blob/master/documentation/asdf_user_install.md)
- [asdf_script](https://github.com/asdf-chef/asdf/blob/master/documentation/asdf_script.md)
- [asdf_plugin](https://github.com/asdf-chef/asdf/blob/master/documentation/asdf_plugin.md)
- [asdf_package](https://github.com/asdf-chef/asdf/blob/master/documentation/asdf_package.md)
- [asdf_exec](https://github.com/asdf-chef/asdf/blob/master/documentation/asdf_exec.md)

## Testing

For more details look at the [TESTING.md](./TESTING.md).

## Credit

This cookbook is based off of the [ruby_rbenv](https://github.com/sous-chefs/ruby_rbenv) cookbook.

## Contributors

- Fernando Alemán <fernandoaleman@mac.com>
