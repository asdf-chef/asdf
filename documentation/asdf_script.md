# asdf_script

## Actions

- `:run`

## Properties

| Name          | Type           | Default         | Description                                                         |
| ------------- | -------------- | --------------- | ------------------------------------------------------------------- |
| `code`        | String         | `name_property` | asdf command to run.                                                |
| `environment` | Hash           | `{}`            | Environment variables to run script.                                |
| `path`        | Array          | `[]`            | List of additional paths to include in environment path.            |
| `returns`     | Array          | `[0]`           | Expected return code.                                               |
| `timeout`     | Integer, Float | `3600`          | Amount of time (in seconds) a command is to wait before timing out. |
| `live_stream` | True, False    | `true`          | Whether or not to output verbose stream.                            |
| `user`        | String         | `nil`           | Which user to run asdf code as.                                     |

## Examples

```ruby
asdf_script 'plugin-add ruby'
```
