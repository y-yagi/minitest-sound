require_relative 'test_helper'
require 'sys/proctable'
include Sys

module MinitestSoundTest
  class PlayerTest < MiniTest::Test
    def setup
      @fixtures_directory = File.expand_path('../fixtures', __FILE__)
    end

    def test_do_nothing_when_unset_success
      player = Minitest::Sound::Player.new
      player.play_success_sound
      assert_equal(false, play_sound?)
    end

    def test_play_success_sound_when_set_success
      success_sound = File.join(@fixtures_directory, 'success.mp3')
      player = Minitest::Sound::Player.new(success: success_sound)
      pid = player.play_success_sound(false)
      assert_equal(true, play_sound?(success_sound))
      Process.kill('SIGINT', pid)
    end

    def test_do_nothing_when_unset_failure
      player = Minitest::Sound::Player.new
      player.play_failure_sound
      assert_equal(false, play_sound?)
    end

    def test_play_failure_sound_when_set_faiure
      failure_sound = File.join(@fixtures_directory, 'failure.mp3')
      player = Minitest::Sound::Player.new(failure: failure_sound)
      pid = player.play_failure_sound(false)
      assert_equal(true, play_sound?(failure_sound))
      Process.kill('SIGINT', pid)
    end

    def test_output_errmsg_when_donot_install_mpg123
      original_path = ENV['PATH']
      ENV['PATH'] = ''

      success_sound = File.join(@fixtures_directory, 'success.mp3')
      player = Minitest::Sound::Player.new(success: success_sound)

      out, err = capture_io { player.play_success_sound }
      assert_equal(%Q(warning: minitest-sound use "mpg123". Please install "mpg123".\n), err)
    ensure
      ENV['PATH'] = original_path
    end

    private
    def play_sound?(file = nil)
      processes = ProcTable.ps.select{|s| s.comm == 'mpg123'}
      return false if processes.empty?

      processes.any?{|p| p.cmdline == "mpg123 #{file}"}
    end
  end
end
