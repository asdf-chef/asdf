# asdf_user_install

## Actions

- `:install`

## Properties

| Name                  | Type        | Default                               | Description                                 |
| --------------------- | ----------- | ------------------------------------- | ------------------------------------------- |
| `user`                | String      | `name_property`                       | Which user to install asdf to.              |
| `git_url`             | String      | `https://github.com/asdf-vm/asdf.git` | Git url to checkout asdf from.              |
| `git_ref`             | String      | `nil`                                 | Git reference to checkout.                  |
| `update_asdf`         | True, False | `false`                               | Whether or not to update asdf.              |
| `legacy_version_file` | True, False | `false`                               | Whether or not to use legacy version files. |

## Examples

```ruby
asdf_user_install 'admin'
```
