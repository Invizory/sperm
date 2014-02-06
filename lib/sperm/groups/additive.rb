require 'sperm/groups/intmod'

module Sperm::Groups
  # Represents (Z/nZ, +) - an additive cyclic group of integers modulo n.
  #
  class ZnAdd
    include Zn

    attr_reader :modulo
    alias_method :order, :modulo

    def initialize(modulo_factors)
      @modulo_factors = modulo_factors.uniq
      @modulo = modulo_factors.inject(1, &:*)
    end

    def generator?(number)
      fail ArgumentError, 'not an element' unless include?(number)
      @modulo_factors.all? { |prime| coprime_with_prime?(number, prime) }
    end

    private

    def coprime_with_prime?(number, prime)
      number % prime != 0
    end
  end
end
