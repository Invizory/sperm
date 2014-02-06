$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sperm'

# Coverage
if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start do
    add_filter 'vendor'
  end
end

# Some helpers for Enumerable.
#
module Enumerable
  def permutation?
    sort.to_a == (0...count).to_a
  end

  def empty?
    count == 0
  end
end
