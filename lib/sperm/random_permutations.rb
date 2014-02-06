require 'sperm/groups'
require 'sperm/exceptions'
require 'sperm/random_source'

module Sperm
  # Generates random permutations of given order.
  #
  class RandomPermutations
    attr_reader :order

    def initialize(order, random = Random.new, groups = Groups::GroupsCollection::DEFAULT)
      isomorphism = groups.find_suitable_isomorphism(order)
      fail NoSuitableGroup, order unless isomorphism
      random_source = RandomSource.new(random)
      @order = order
      @shuffler = Groups::ZpMulShuffler.new(isomorphism, random_source)
    end

    def rand
      @shuffler.rand.select { |element| element.between?(1, order) }.map { |element| element - 1 }
    end
  end
end
