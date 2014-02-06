require 'sperm/groups/additive'
require 'sperm/groups/multiplicative'
require 'sperm/groups/isomorphism'

require 'ostruct'
require 'yaml'

module Sperm::Groups
  # Represents collection of known cyclic groups that can be used
  # for generating random permutations.
  #
  class GroupsCollection
    def initialize(isomorphisms)
      @isomorphisms = isomorphisms.sort_by { |isomorphism| isomorphism.order }
    end

    def find_suitable_isomorphism(order)
      @isomorphisms.bsearch { |isomorphism| isomorphism.order >= order }
    end

    def self.load_file(path)
      array = YAML.load_file(path)
      isomorphisms = array.map { |hash| OpenStruct.new(hash) }.map do |group|
        add_group = ZnAdd.new(group.order_factors)
        mul_group = ZpMul.new(group.prime, group.generator)
        Isomorphism.new(add_group, mul_group)
      end
      new(isomorphisms)
    end

    DEFAULT_FILE = File.expand_path('../../../../data/groups.yml', __FILE__)
    DEFAULT = load_file(DEFAULT_FILE)
  end
end
