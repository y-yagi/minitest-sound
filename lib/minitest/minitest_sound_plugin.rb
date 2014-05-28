require_relative 'sound/reporter'

module Minitest
  def self.plugin_minitest_sound_init(opts)
    self.reporter << Minitest::Sound::Reporter.new
  end
end
