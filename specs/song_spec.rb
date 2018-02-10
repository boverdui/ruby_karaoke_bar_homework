require("minitest/autorun")
require_relative("../song")

class TestSong < MiniTest::Test

  def setup()
    @song_1 = Song.new("Thunder Road", "Bruce Springsteen")
  end

  def test_song_has_title()
    assert_equal("Thunder Road", @song_1.title())
  end

  def test_song_has_artist()
    assert_equal("Bruce Springsteen", @song_1.artist())
  end

end
