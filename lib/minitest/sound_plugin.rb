require_relative 'sound'
require_relative 'sound/reporter'

module Minitest
  def self.plugin_sound_init(_opts)
    self.reporter << Minitest::Sound::Reporter.new
  end
end
