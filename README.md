# Stupendous Permutations
**Sperm** is a random permutations generator based on the ideas of group
theory that allows you to generate very large permutations without extra
memory consumption.

## Installation
Add this line to your application's Gemfile:
```ruby
gem 'sperm'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install sperm
```

## Usage
```ruby
Sperm.rand(5).each { |element| puts element }
```

This is a shorthand for:
```ruby
Sperm::RandomPermutations.new(5).rand.each { |element| puts element }
```

You can also use your own source of randomness:
```ruby
Sperm::RandomPermutations.new(5, Random.new(42))
Sperm::RandomPermutations.new(10**8, SecureRandom)
```

## How it works
### Computational complexity
Operation                  | Time complexity    | Space complexity
---------------------------|--------------------|------------------
Initialization             | O(n/ϕ(n) · log(n)) | O(1)
Generation of next element | O(1)               | O(1)

## Copyright
Copyright © 2014 [Arthur Khashaev]. See [LICENSE.txt](LICENSE.txt) for details.

[Arthur Khashaev]: http://khashaev.ru/
