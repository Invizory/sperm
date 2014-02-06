require 'openssl'

module Sperm::Groups
  # Provides isomorphism from (Z/(p-1)Z, +) to (Z/pZ \ {0}, *).
  #
  class Isomorphism
    extend Forwardable

    attr_reader :add_group, :mul_group
    def_delegator :add_group, :order

    def initialize(add_group, mul_group)
      fail ArgumentError, 'unequal orders' unless add_group.order == mul_group.order
      @add_group = add_group
      @mul_group = mul_group
    end

    def map(number)
      fail ArgumentError, 'not an element' unless add_group.include?(number)
      mul_group.generator.to_bn.mod_exp(number, mul_group.modulo).to_i
    end
  end
end
