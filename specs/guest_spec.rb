require("minitest/autorun")
require_relative("../guest")
require_relative("../bar")
require_relative("../drink")
require_relative("../room")
require_relative("../song")

class TestGuest < MiniTest::Test

  def setup()
    @song_1 = Song.new("Thunder Road", "Bruce Springsteen")
    @song_2 = Song.new("Amarillo", "Tony Christie")
    @song_3 = Song.new("Believe", "Cher")
    @guest_1 = Guest.new("Bert", 100.00, @song_1)
    @guest_2 = Guest.new("Alex", 5.00, @song_2)
    @guest_3 = Guest.new("Amy", 20.00, @song_3)
    @room_1 = Room.new("Room 1", 2, [@song_1])
    @drink_1 = Drink.new("beer", 3.00)
    tabs = [{guest: @guest_1, drinks: [@drink_1, @drink_1]}, {guest: @guest_2, drinks: [@drink_1, @drink_1]}]
    @bar = Bar.new("CodeClan Caraoke Bar", 10.00, [@room_1], [@drink_1], 0.00, tabs)
  end

  def test_guest_has_name()
    assert_equal("Bert", @guest_1.name())
  end

  def test_guest_has_wallet()
    assert_equal(100.00, @guest_1.wallet())
  end

  def test_guest_has_favourite_song()
    assert_equal(@song_1, @guest_1.favourite_song())
  end

  def test_guest_has_sufficient_funds__sufficient()
    assert_equal(true, @guest_1.sufficient_funds?(@bar.entry_fee()))
  end

  def test_guest_has_sufficient_funds__insufficient()
    assert_equal(false, @guest_2.sufficient_funds?(@bar.entry_fee()))
  end

  def test_customer_can_gain_entry__yes()
    @guest_1.pay_entry(@bar)
    assert_equal(90.00, @guest_1.wallet())
  end

  def test_customer_can_gain_entry__no()
    @guest_2.pay_entry(@bar)
    assert_equal(5.00, @guest_2.wallet())
  end

  def test_guest_fav_song_on_playlist__yes()
    assert_equal("WHOO!!!", @guest_1.fav_on_playlist(@room_1))
  end

  def test_guest_fav_song_on_playlist__no()
    assert_equal("Bugger...", @guest_3.fav_on_playlist(@room_1))
  end

  def test_guest_pays_tab__sufficient_funds()
    @guest_1.pay_tab(@bar)
    assert_equal(94.00, @guest_1.wallet())
  end

  def test_guest_pays_tab__insufficient_funds()
    @guest_2.pay_tab(@bar)
    assert_equal(5.00, @guest_2.wallet())
  end

end
