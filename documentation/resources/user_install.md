# asdf_user_install

Installs asdf to the user path, making asdf only available to that user.

```ruby
asdf_user_install 'name' do
  user                String
  git_url             String
  git_ref             String
  update_asdf         [true, false]
  legacy_version_file [true, false]
end
```

## Actions

| Action     | Default  |
| ---------- | -------- |
| `:install` | &#x2713; |

## Properties

### `user`

Which user to install asdf to.

| property      | value  |
| ------------- | ------ |
| Type          | String |
| Default       | `name` |
| Name Property | `true` |

### `git_url`

Git url to checkout asdf from.

| property| value                                 |
| ------- | ------------------------------------- |
| Type    | String                                |
| Default | `https://github.com/asdf-vm/asdf.git` |

### `git_ref`

Git reference to checkout.

| property| value  |
| ------- | ------ |
| Type    | String |
| Default |        |

### `update_asdf`

Whether or not to update asdf.

| property | value         |
| -------- | ------------- |
| Type     | [true, false] |
| Default  | `true`        |

### `legacy_version_file`

Whether or not to use legacy version files.

| property | value         |
| -------- | ------------- |
| Type     | [true, false] |
| Default  | `false`       |
