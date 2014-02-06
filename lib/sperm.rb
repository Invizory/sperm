require 'sperm/version'
require 'sperm/exceptions'
require 'sperm/random_permutations'

# Sperm is an efficient random permutations generator.
#
module Sperm
  def self.rand(order)
    RandomPermutations.new(order).rand
  end
end
