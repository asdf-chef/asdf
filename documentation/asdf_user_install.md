# asdf_user_install

## Actions

- `:install`

## Properties

| Name                  | Type        | Default                               | Description                                 |
| --------------------- | ----------- | ------------------------------------- | ------------------------------------------- |
| `git_url`             | String      | `https://github.com/asdf-vm/asdf.git` | Git url to checkout asdf from.              |
| `git_ref`             | String      | `master`                              | Git reference to checkout.                  |
| `update_asdf`         | True, False | `true`                                | Whether or not to update asdf.              |
| `legacy_version_file` | True, False | `false`                               | Whether or not to use legacy version files. |
| `user`                | String      | `name_property`                       | Which user to install asdf to.              |

## Examples

```ruby
asdf_user_install 'admin'
```
