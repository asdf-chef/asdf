# asdf_exec

## Actions

- `:run`

## Properties

| Name          | Type        | Default         | Description                              |
| ------------- | ----------- | --------------- | ---------------------------------------- |
| `command`     | String      | `name_property` | Command to run through asdf exex.        |
| `live_stream` | True, False | `true`          | Whether or not to output verbose stream. |
| `user`        | String      | `nil`           | Which user to run asdf code as.          |

## Examples

```ruby
asdf_exec 'gem install bundler'
```
