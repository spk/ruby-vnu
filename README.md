# ruby-vnu

## Description

Ruby wrapper for Nu HTML validator (https://validator.github.io/validator/)

## Installation

### Debian

```
aptitude install openjdk-8-jre-headless
```

### RubyGems

```
gem install ruby-vnu
```

## Usage

``` ruby
require 'vnu'

Vnu.cli # => "java -jar GEMHOME/ruby-vnu/vnu.jar"
Vnu.cli = "java -Xss512k -jar #{Vnu::JAR_PATH}"
Vnu.validate('<!doctype html><title>', errors_only: true, format: 'json')
```

## Tests

```
bundle exec rake
```

## License

The MIT License

Copyright (c) 2015 Laurent Arnoud <laurent@spkdev.net>

---
[![Gem
Version](https://badge.fury.io/rb/ruby-vnu.svg)](https://rubygems.org/gems/ruby-vnu)
[![Build
Status](https://secure.travis-ci.org/spk/ruby-vnu.svg?branch=master)](https://travis-ci.org/spk/ruby-vnu)
[![Code
Climate](http://img.shields.io/codeclimate/github/spk/ruby-vnu.svg)](https://codeclimate.com/github/spk/ruby-vnu)
