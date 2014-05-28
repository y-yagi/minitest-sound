require 'minitest'
module Minitest
  module Sound
    class << self
      attr_accessor :success, :failure
    end
  end
end
