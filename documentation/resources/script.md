# asdf_script

Runs an asdf aware script.

```ruby
asdf_script 'name' do
  code        String
  environment Hash
  live_stream [true, false]
  path        String
  returns     Array
  timeout     [Integer, Float]
  user        String
end
```

## Actions

| Action    | Default  |
| --------- | -------- |
| `:run`    | &#x2713; |

## Properties

### `code`

asdf command to run.

| property      | value  |
| ------------- | ------ |
| Type          | String |
| Default       | `name` |
| Name Property | `true` |

### `environment`

Environment variables to run script.

| property| value |
| ------- | ----- |
| Type    | Hash  |
| Default | `{}`  |

### `live_stream`

Whether or not to output verbose stream.

| property | value         |
| -------- | ------------- |
| Type     | [true, false] |
| Default  | `true`        |

### `path`

Additional path to include in environment path.

| property| value |
| ------- | ----- |
| Type    | Array |
| Default | `[]`  |

### `returns`

Expected return code.

| property| value |
| ------- | ----- |
| Type    | Array |
| Default | `[0]` |

### `timeout`

Amount of time (in seconds) a command is to wait before timing out.

| property| value          |
| ------- | -------------- |
| Type    | Integer, Float |
| Default | `3600`         |

### `user`

Which user to run asdf code as.

| property | value  |
| -------- | ------ |
| Type     | String |
| Default  |        |
