# Contributing

## Contribution Guidelines

- Please submit improvements and bug fixes via Github pull requests.

- All commits should have well-written commit message.  The first line
  should summarize the change while the rest of the commit message
  should explain the reason the change is needed.

- Please ensure all tests and lint checking pass before submitting
  pull requests.

## Development

### Requirements

- Latest ChefDK
- [Docker](https://www.docker.com/docker-mac)
- [Vagrant](https://vagrantup.com)
- [VirtualBox](https://virtualbox.org)

### Development Flow

1. Clone the git repository from GitHub:

        git clone git@github.com:asdf-chef/asdf.git

2. Create a branch for your changes:

        git checkout -b my_feature

3. Make any changes

4. Write unit and integration tests to support those changes.

5. Run the tests:
    - `chef exec delivery local all`
    - `KITCHEN_LOCAL_YAML=.kitchen.dokken.yml chef exec delivery local all`

6. If tests pass, open a Pull Request on GitHub
