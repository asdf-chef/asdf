# asdf_package

## Actions

- `:install`
- `:global`
- `:uninstall`

## Properties

| Name          | Type        | Default         | Description                                                                                  |
| ------------- | ----------- | --------------- | -------------------------------------------------------------------------------------------- |
| `package`     | String      | `name_property` | Which package to install.                                                                    |
| `version`     | String      | `nil`           | Which package version install. If no version is given, the latest version will be installed. |
| `live_stream` | True, False | `true`          | Whether or not to output verbose stream.                                                     |
| `user`        | String      | `nil`           | Which user to run asdf code as.                                                              |

## Examples

Install the latest version of ruby

```ruby
asdf_package 'ruby'
```

Install ruby 2.6.5 and make it global

```ruby
asdf_package 'ruby' do
  version '2.6.5'
  action [:install, :global]
end
```
