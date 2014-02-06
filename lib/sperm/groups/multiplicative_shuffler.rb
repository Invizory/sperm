module Sperm::Groups
  # Generates random cyclic representations of (Z/pZ \ {0}, *).
  #
  class ZpMulShuffler
    def initialize(isomorphism, rand_source)
      @isomorphism, @rand_source = isomorphism, rand_source
    end

    def rand
      first = 1 + @rand_source.rand(mul_group.modulo - 1)
      mul_group.produce_cycle(first, rand_mul_generator).lazy
    end

    private

    def rand_mul_generator
      add_gen = rand_add_generator
      @isomorphism.map(add_gen)
    end

    def rand_add_generator
      gen = @rand_source.rand(add_group.modulo)
      gen = (gen + 1) % add_group.modulo until add_group.generator?(gen)
      gen
    end

    def add_group
      @isomorphism.add_group
    end

    def mul_group
      @isomorphism.mul_group
    end
  end
end
