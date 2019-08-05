# asdf_plugin

Installs, updates or removes an asdf plugin.

```ruby
asdf_plugin 'name' do
  git_url     String
  live_stream [true, false]
  user        String
end
```

## Actions

| Action    | Default  |
| --------- | -------- |
| `:add`    | &#x2713; |
| `:update` |          |
| `:remove` |          |

## Properties

### `git_url`

Git url to checkout plugin from.

| property | value  |
| -------- | ------ |
| Type     | String |
| Default  |        |

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
