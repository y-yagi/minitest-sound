module Minitest
  module Sound
    class Player
      def initialize(success: nil, failure: nil, during_test: nil)
        @success_sound = success
        @failure_sound = failure
        @during_test_sound = during_test
        @during_test_pid = nil
      end

      def play(file: file, sync: true)
        return if file.nil? || file.empty?

        pid = spawn("mpg123 #{file}", err: '/dev/null')
        Process.waitpid(pid) if sync
        pid
      rescue Errno::ENOENT
        $stderr.puts message
      end

      def success(sync = true)
        play(file: @success_sound, sync: sync)
      end

      def failure(sync = true)
        play(file: @failure_sound, sync: sync)
      end

      def play_during_test_sound(sync = false)
        @during_test_pid = play(file: @during_test_sound, sync: sync)
      end

      def stop_during_test_sound
        return unless @during_test_pid
        Process.kill('SIGINT', @during_test_pid)
      end

      def message
        'warning: minitest-sound use "mpg123". Please install "mpg123".'
      end
    end
  end
end

