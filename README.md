# infratest-formula
A [Salt](https://github.com/saltstack/salt) formula to install and configure the [infratest module](https://github.com/ssplatt/saltstack-infratest-module).

This formula was initialized with [Saltscaffold](https://github.com/cmarzullo/saltscaffold).

[![asciicast](https://asciinema.org/a/3b7exrkl5fnjxsj2szp5ik42e.png)](https://asciinema.org/a/3b7exrkl5fnjxsj2szp5ik42e)

# Default configuration
By default, the formula is disabled. When enabled, it will install `git`, `python-pip`, and `testinfra` as dependencies for pulling the `infratest` module down from Github and loading it into Salt.
```yaml
# infratest/defaults.yml
infratest:
  enabled: false
  run_all: false
  mockup:
    enabled: true
    deps:
      - git
      - python-pip
  install:
    git: true
    pkg: infratest
    url: https://github.com/ssplatt/saltstack-infratest-module.git
    target: /srv/salt/_modules
    branch: master
    user: root
    deps:
      from_pip: true
      pkgs:
        - testinfra
```

# Development and Testing
Ensure Vagrant, Ruby, and Ruby Gems packages are installed.

(Mac) Install and setup brew:
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

```
brew install cask
brew cask install vagrant
```

```
cd <formula dir>
bundle install
```
or
```
sudo gem install test-kitchen
sudo gem install kitchen-vagrant
sudo gem install kitchen-salt
```

Run a converge on the default configuration:
```
kitchen converge
```

## Test in the Cloud
Instead of running on a VM locally using Vagrant, you can test the formula on a cloud provider, like Linode. The settings are configured in the `.kitchen-ci.yml` file.

See the [kitchen-linode](https://github.com/ssplatt/kitchen-linode) repository for more details.
