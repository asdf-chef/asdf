# asdf_package

Installs, uninstalls and sets global an asdf package.
**See [Package Dependencies](#package-dependencies) below.**

```ruby
asdf_package 'name' do
  package     String
  version     String
  live_stream [true, false]
  user        String
end
```

## Actions

| Action       | Default  |
| ------------ | -------- |
| `:install`   | &#x2713; |
| `:global`    |          |
| `:uninstall` |          |

## Properties

### `package`

Which package to install.

| property      | value      |
| ------------- | ---------- |
| Type          | String     |
| Default       | `name`     |
| Name Property | `true`     |

### `version`

Which package version to install.

| property | value  |
| -------- | ------ |
| Type     | String |
| Default  |        |
| Required | `true` |

### `live_stream`

Whether or not to output verbose stream.

| property | value         |
| -------- | ------------- |
| Type     | [true, false] |
| Default  | `true`        |

### `user`

Which user to run asdf code as.

| property | value  |
| -------- | ------ |
| Type     | String |
| Default  |        |

## Package Dependencies

Although this cookbook is slowly but surely trying to make sure that
dependencies are installed for each package on all supported operating systems,
you may still need to add dependencies that have not been pre-installed for a
particular package. If you do indeed get a package installed with dependencies
that have not yet been pre-installed via this cookbook, please open up a pull
request for review to be added.
