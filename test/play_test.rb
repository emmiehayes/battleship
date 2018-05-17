require './test/test_helper'
require './lib/play'

class PlayTest < Minitest::Test

  def test_it_exists
    p = Play.new
    assert_instance_of Play, p
  end

end
