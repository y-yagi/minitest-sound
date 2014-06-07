require 'minitest'
module Minitest
  module Sound
    class << self
      attr_accessor :success, :failure, :during_test
    end
  end
end
