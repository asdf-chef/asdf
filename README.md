# Chef asdf cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/asdf.svg)](https://supermarket.chef.io/cookbooks/asdf) [![Build Status](https://travis-ci.org/asdf-chef/asdf.svg?branch=master)](https://travis-ci.org/asdf-chef/asdf)

Manages [asdf](https://github.com/asdf-vm/asdf) extendable version manager.

# Requirements

## Chef

This cookbook requires Chef 12.9+.

## Platforms

- Ubuntu 14.04
- Ubuntu 16.04

# Dependencies

- apt

# Usage

Place a dependency on the asdf cookbook in your cookbook's metadata.rb

```ruby
depends 'asdf'
```

Examples are provided in `test/cookbooks/test/recipes`.

A `asdf_user_install` is required so that asdf is installed. See `Resources` below.

# Testing

For more details look at the [TESTING.md](./TESTING.md).

# Resources

## asdf_user_install

Installs asdf to the user path, making asdf only available to that user.

```ruby
asdf_user_install 'user' do
  git_url                   # Optional
  git_ref                   # Optional
  update_asdf               # Optional
  legacy_version_file       # Optional
end
```

### Actions

This resource has the following actions:

- `:install` Default. Install asdf.

### Properties

This resource has the following properties:

- `git_url` The git url to checkout asdf from. Defaults to *https://github.com/asdf-vm/asdf.git*.
- `git_ref` The git reference to checkout. Defaults to *v0.4.0*.
- `update_asdf` Whether or not to keep the git repo up to date. Defaults to *true*.
- `legacy_version_file` Whether or not to use legacy version files, i.e. .ruby-version. Defaults to *false*.

## asdf_plugin

Installs, updates or removes an asdf plugin.

```ruby
asdf_plugin 'plugin' do
  user                      # Required
  git_url                   # Optional
  live_stream               # Optional
end
```

### Actions

This resource has the following actions:

- `:add` Default. Add plugin.
- `:update` Update plugin.
- `:remove` Remove plugin.

### Properties

- `user` The user to run asdf as.
- `git_url` The git url to checkout plugin from. Defaults to the *asdf plugin repo*.
- `live_stream` Whether or not to output verbose stream. Defaults to *false*.

## asdf_package

Installs, uninstalls and sets global an asdf package.

```ruby
asdf_package 'package' do
  user                      # Required
  version                   # Required
  live_stream               # Optional
end
```

### Actions

This resource has the following actions:

- `:install` Default. Install package.
- `:global` Set package global.
- `:uninsstall` Uninstall package.

### Properties

- `user` The user to run asdf as.
- `version` The package version.
- `live_stream` Whether or not to output verbose stream. Defaults to *false*.

## asdf_script

Runs an asdf aware script.

```ruby
asdf_script 'foo' do
  user                      # Required
  code                      # Required
  path                      # Optional
  environment               # Optional
  returns                   # Optional
  live_stream               # Optional
end
```

### Actions

This resource has the following actions:

- `:run` Default. Run a script.

### Properties

- `user` The user to run asdf as.
- `code` The script code to run.
- `path` Additional path to include in environment path.
- `environment` Environment variables to run script. Defaults to *{}*.
- `returns` Expected return code. Defaults to *0*.
- `live_stream` Whether or not to output verbose stream. Defaults to *false*.

# Credit

This cookbook is based off of the [ruby_rbenv](https://github.com/sous-chefs/ruby_rbenv) cookbook.

# Authors

- Author:: Fernando Aleman <fernandoaleman@mac.com>

```text
Copyright:: Fernando Aleman
```

