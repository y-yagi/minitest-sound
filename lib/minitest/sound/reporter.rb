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
        (errors == 0 && failures == 0) ? @player.play_success_sound : @player.play_failure_sound
      end


      # When using the following methods together with xxx, they are required.
      def add_defaults(defaults); end

      def before_test(test); end

      def after_test(test); end
    end
  end
end
