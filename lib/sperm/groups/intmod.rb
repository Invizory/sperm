module Sperm::Groups
  # Represents Z/nZ group.
  #
  module Zn
    def include?(element)
      (0...modulo).include?(element)
    end
  end
end
