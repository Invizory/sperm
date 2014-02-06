module Sperm
  # Internal wrapper for Random instances and RandomSecure.
  #
  class RandomSource
    include Forwardable

    def initialize(adaptee)
      @adaptee = adaptee

      %i(rand random_number).each do |method|
        next unless @adaptee.respond_to? method
        def_delegator :@adaptee, method, :rand
        return
      end

      fail ArgumentError, 'unsupported source of randomness'
    end
  end
end
