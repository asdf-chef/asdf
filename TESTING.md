# TESTING

A ruby environment with ChefDK installed is a prerequisite for testing
this cookbook. All programs involved, with the exception of Docker and Vagrant,
are installed by ChefDK.

## Style Testing

Ruby style tests using Rubocop can be performed with:

```
chef exec cookstyle
```

Chef style tests using Foodcritic can be performed with:

```
chef exec foodcritic .
```

## Spec Testing

Unit testing is done by running Rspec examples. Rspec will test any
libraries, then test recipes using ChefSpec. This works by compiling a
recipe (but not converging it), and allowing the user to make
assertions about the resource_collection.

Spec tests using Rspec can be performed with:

```
chef exec rspec spec/
```

## Integration Testing

Integration testing is performed by Test Kitchen. Test Kitchen will
use either the Vagrant driver or the Docker driver to instantiate
machines and apply cookbooks. After a successful converge, tests are
uploaded and ran out of band of Chef. Tests should be designed to
ensure that a recipe has accomplished its goal.

### Integration Testing using Vagrant

Integration tests can be performed on a local workstation using
Virtualbox or VMWare. Detailed instructions for setting this up can be
found at the [Bento](https://github.com/chef/bento) project web site.

Integration tests using Vagrant can be performed with:

```
chef exec kitchen test
```

### Integration Testing using Docker

Integration tests can be performed on a local workstation using
[Docker for Mac](https://docs.docker.com/docker-for-mac/).

Integration tests using Docker can be performed with:

```
KITCHEN_LOCAL_YAML=.kitchen.dokken.yml chef exec kitchen test
```
