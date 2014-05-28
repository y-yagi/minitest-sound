module Minitest
  module Sound
    class Player
      def initialize(success: nil, failure: nil)
        @success_sound = success
        @failure_sound = failure
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

      def message
        'warning: minitest-sound use "mpg123". Please install "mpg123".'
      end
    end
  end
end

