require("minitest/autorun")
require_relative("../room")
require_relative("../guest")
require_relative("../song")

class TestRoom < MiniTest::Test

  def setup()
    @song_1 = Song.new("Thunder Road", "Bruce Springsteen")
    @song_2 = Song.new("Believe", "Cher")
    @song_3 = Song.new("Amarillo", "Tony Christie")
    @guest_1 = Guest.new("Bert", 50.00, @song_1)
    @guest_2 = Guest.new("Amy", 100.00, @song_2)
    @guest_3 = Guest.new("Alex", 75.00, @song_3)
    @room_1 = Room.new("Room 1", 2, [@song_1], guests)
  end

  def test_room_has_name()
    assert_equal("Room 1", @room_1.name())
  end

  def test_room_has_capacity()
    assert_equal(2, @room_1.capacity())
  end

  def test_room_has_playlist()
    assert_equal([@song_1], @room_1.playlist())
  end

  def test_add_song_to_playlist()
    @room_1.add_song(@song_2)
    assert_equal([@song_1, @song_2], @room_1.playlist())
  end

  def test_remove_song_from_room()
    @room_1.add_song(@song_2)
    @room_1.remove_song(@song_2)
    assert_equal([@song_1], @room_1.playlist())
  end

  def test_room_is_empty()
    assert_equal(0, @room_1.count_guests())
  end

  def test_check_in_guest()
    @room_1.check_in_guest(@guest_1)
    @room_1.check_in_guest(@guest_2)
    assert_equal(2, @room_1.count_guests())
  end

  def test_check_in_guest__full()
    @room_1.check_in_guest(@guest_1)
    @room_1.check_in_guest(@guest_2)
    @room_1.check_in_guest(@guest_3)
    assert_equal(2, @room_1.count_guests())
  end

  def test_check_out_guest()
    @room_1.check_in_guest(@guest_1)
    @room_1.check_in_guest(@guest_2)
    @room_1.check_out_guest(@guest_1)
    assert_equal(1, @room_1.count_guests())
  end

  def test_empty_out_room()
    @room_1.check_in_guest(@guest_1)
    @room_1.check_in_guest(@guest_2)
    @room_1.empty()
    assert_equal(0, @room_1.count_guests())
  end

end
