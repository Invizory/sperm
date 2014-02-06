require 'sperm/groups/intmod'

module Sperm::Groups
  # Represents (Z/pZ \ {0}, *) - a multiplicative cyclic group of integers
  # modulo p.
  #
  class ZpMul
    include Zn

    attr_reader :prime, :generator
    alias_method :modulo, :prime

    def initialize(prime, generator)
      @prime = prime
      @generator = generator
    end

    def order
      modulo - 1
    end

    def produce_cycle(first, multiplier)
      fail ArgumentError, 'not an element' unless include?(first) && include?(multiplier)
      Enumerator.new do |yielder|
        current = first
        loop do
          yielder.yield current
          current = (current * multiplier) % modulo
          break if current == first
        end
      end
    end
  end
end
