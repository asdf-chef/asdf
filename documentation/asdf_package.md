# asdf_package

## Actions

- `:install`
- `:global`
- `:uninstall`

## Properties

| Name          | Type        | Default         | Description                                 |
| ------------- | ----------- | --------------- | ------------------------------------------- |
| `package`     | String      | `name_property` | Which package to install.                   |
| `version`     | String      |                 | **Required** Which package version install. |
| `live_stream` | True, False | `true`          | Whether or not to output verbose stream.    |
| `user`        | String      | `nil`           | Which user to run asdf code as.             |

## Examples

```ruby
asdf_package 'ruby' do
  version '3.0.0'
end
```
