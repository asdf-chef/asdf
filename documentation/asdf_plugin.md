# asdf_plugin

## Actions

- `:add`
- `:update`
- `:remove`

## Properties

| Name          | Type        | Default | Description                              |
| ------------- | ----------- | ------- | ---------------------------------------- |
| `git_url`     | String      | `nil`   | Git url to checkout plugin from.         |
| `live_stream` | True, False | `true`  | Whether or not to output verbose stream. |
| `user`        | String      | `nil`   | Which user to run asdf code as.          |

## Examples

```ruby
asdf_plugin 'ruby'
```
