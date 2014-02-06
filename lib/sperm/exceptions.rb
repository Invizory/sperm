module Sperm
  # This runtime error appears when requested permutation order is bigger
  # than maximum group order in known set of cyclic groups.
  #
  class NoSuitableGroup < RuntimeError
    attr_reader :order

    def initialize(order)
      @order = order
    end

    def to_s
      "no suitable group for permutation of order #{order} found"
    end
  end
end
