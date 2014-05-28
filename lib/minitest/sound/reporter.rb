require_relative 'player'

module Minitest
  module Sound
    class Reporter < StatisticsReporter
      def initialize(io = $stdout, options = {})
        super(io, options)
        @player = Minitest::Sound::Player.new(success: Minitest::Sound.success, failure: Minitest::Sound.failure)
      end

      def report
        super
        (errors == 0 && failures == 0) ? @player.success : @player.failure
      end
    end
  end
end
