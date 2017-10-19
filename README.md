# Chef asdf cookbook

[![Build Status](https://travis-ci.org/asdf-chef/asdf.svg?branch=master)](https://travis-ci.org/asdf-chef/asdf)

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

# Credit

This cookbook is based off of the [ruby_rbenv](https://github.com/sous-chefs/ruby_rbenv) cookbook.

# Authors

- Author:: Fernando Aleman <fernandoaleman@mac.com>

```text
Copyright:: Fernando Aleman
```
