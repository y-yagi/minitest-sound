require_relative 'player'

module Minitest
  module Sound
    class Reporter < StatisticsReporter
      def initialize(io = $stdout, options = {})
        super(io, options)
        @player = Minitest::Sound::Player.new(
          success: Minitest::Sound.success, failure: Minitest::Sound.failure,
          during_test: Minitest::Sound.during_test,
        )
      end

      def start
        super
        @player.play_during_test_sound
      end

      def report
        super
        @player.stop_during_test_sound
        (errors == 0 && failures == 0) ? @player.success : @player.failure
      end
    end
  end
end
