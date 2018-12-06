# asdf Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/asdf.svg)](https://supermarket.chef.io/cookbooks/asdf) [![Build Status](https://travis-ci.org/asdf-chef/asdf.svg?branch=master)](https://travis-ci.org/asdf-chef/asdf)

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

Other Debian and RHEL family distributions are assumed to work.

## Dependencies

- ark

## Usage

Place a dependency on the asdf cookbook in your cookbook's metadata.rb

```ruby
depends 'asdf'
```

Examples are provided in `test/cookbooks/test/recipes`.

A `asdf_user_install` is required so that asdf is installed. See `Resources` below.

## Testing

For more details look at the [TESTING.md](./TESTING.md).

## Resources

- [asdf_package](#asdf_package)
- [asdf_plugin](#asdf_plugin)
- [asdf_script](#asdf_script)
- [asdf_user_install](#asdf_user_install)

### asdf_package

Installs, uninstalls and sets global an asdf package.
**See [Package Dependencies](#package-dependencies) below.**

```ruby
asdf_package 'name' do
  user                      String
  version                   String
  live_stream               TrueClass, FalseClass
end
```

#### _Actions_

This resource has the following actions:

- `:install` Default
- `:global`
- `:uninstall`

#### _Properties_

This resource has the following properties:

- `user` The user to run asdf as. *Required*.
- `version` The package version. *Required*.
- `live_stream` Whether or not to output verbose stream. Defaults to `false`.

### asdf_plugin

Installs, updates or removes an asdf plugin.

```ruby
asdf_plugin 'name' do
  user                      String
  git_url                   String
  live_stream               TrueClass, FalseClass
end
```

#### _Actions_

This resource has the following actions:

- `:add` Default
- `:update`
- `:remove`

#### _Properties_

This resource has the following properties:

- `user` The user to run asdf as.
- `git_url` The git url to checkout plugin from. Defaults to the `asdf plugin repo`.
- `live_stream` Whether or not to output verbose stream. Defaults to `false`.

### asdf_script

Runs an asdf aware script.

```ruby
asdf_script 'name' do
  user                      String
  code                      String
  path                      String
  environment               Hash
  returns                   Array
  live_stream               TrueClass, FalseClass
end
```

#### _Actions_

This resource has the following actions:

- `:run` Default

#### _Properties_

This resource has the following properties:

- `user` The user to run asdf as. *Required*.
- `code` The script code to run. *Required*.
- `path` Additional path to include in environment path.
- `environment` Environment variables to run script.
- `returns` Expected return code. Defaults to `[0]`.
- `live_stream` Whether or not to output verbose stream. Defaults to `false`.

### asdf_user_install

Installs asdf to the user path, making asdf only available to that user.

```ruby
asdf_user_install 'name' do
  git_url                   String
  git_ref                   String
  update_asdf               TrueClass, FalseClass
  legacy_version_file       TrueClass, FalseClass
end
```

#### _Actions_

This resource has the following actions:

- `:install` Default

#### _Properties_

This resource has the following properties:

- `git_url` The git url to checkout asdf from. Defaults to `https://github.com/asdf-vm/asdf.git`.
- `git_ref` The git reference to checkout. Defaults to `nil`.
- `update_asdf` Whether or not to keep the git repo up to date. Defaults to `true`.
- `legacy_version_file` Whether or not to use legacy version files, i.e. .ruby-version. Defaults to `false`.

## Package Dependencies

Although this cookbook is slowly but surely trying to make sure that
dependencies are installed for each package on all supported operating systems,
you may still need to add dependencies that have not been pre-installed for a
particular package. If you do indeed get a package installed with dependencies
that have not yet been pre-installed via this cookbook, please open up a pull
request for review to be added.

## Credit

This cookbook is based off of the [ruby_rbenv](https://github.com/sous-chefs/ruby_rbenv) cookbook.

## Authors

- Author:: Fernando Aleman <fernandoaleman@mac.com>

```text
Copyright:: Fernando Aleman
```
