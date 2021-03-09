# TESTING

A ruby environment with Chef Workstation installed is a prerequisite for testing
this cookbook. All programs involved, with the exception of Docker, are
installed by Chef Workstation.

## Style Testing

Ruby style tests using Rubocop can be performed with:

```
chef exec cookstyle
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
use the Docker driver to instantiate machines and apply cookbooks.
Tests should be designed to ensure that a recipe has accomplished
its goal.

Integration tests can be performed on a local workstation using
[Docker for Mac](https://docs.docker.com/docker-for-mac/).

Integration tests using Docker can be performed with:

```
chef exec kitchen test
```
