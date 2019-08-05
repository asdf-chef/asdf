# asdf_exec

Run asdf exec commands.

```ruby
asdf_exec 'name' do
  command     String
  live_stream [true, false]
  user        String
end
```

## Actions

| Action  | Default  |
| ------- | -------- |
| `:run`  | &#x2713; |

## Properties

### `command`

Command to run through asdf exec.

| property      | value      |
| ------------- | ---------- |
| Type          | String     |
| Default       | `name`     |
| Name Property | `true`     |

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
