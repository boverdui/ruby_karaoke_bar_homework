require("minitest/autorun")
require_relative("../bar")
require_relative("../drink")
require_relative("../guest")
require_relative("../room")
require_relative("../song")

class TestBar < MiniTest::Test

  def setup()
    tabs = []
    @song_1 = Song.new("Thunder Road", "Bruce Springsteen")
    @guest_1 = Guest.new("Bert", 100.00, @song_1)
    @guest_2 = Guest.new("Alex", 5.00, @song_2)
    @room_1 = Room.new("Room 1", 2, [@song_1])
    @drink_1 = Drink.new("beer", 3.00)
    @bar = Bar.new("CodeClan Caraoke Bar", 10.00, [@room_1], [@drink_1], 0.00, tabs)
  end

  def test_bar_has_name()
    assert_equal("CodeClan Caraoke Bar", @bar.name())
  end

  def test_bar_has_entry_fee()
    assert_equal(10.00, @bar.entry_fee())
  end

  def test_bar_has_rooms()
    assert_equal([@room_1], @bar.rooms())
  end

  def test_bar_has_drinks()
    assert_equal([@drink_1], @bar.drinks())
  end

  def test_bar_has_till()
    assert_equal(0.00, @bar.till())
  end

  def test_bar_has_tabs()
    assert_equal([], @bar.tabs())
  end

  def test_bar_allows_guest_entry()
    @bar.allow_entry()
    assert_equal(10.00, @bar.till())
  end

  def test_bar_opens_tab()
    @bar.open_tab(@guest_1)
    assert_equal([{guest: @guest_1, drinks: []}], @bar.tabs())
  end

  def test_bar_adds_drink_to_tab()
    @bar.open_tab(@guest_1)
    @bar.add_to_tab(@guest_1, @drink_1)
    assert_equal([{guest: @guest_1, drinks: [@drink_1]}], @bar.tabs())
  end

  def test_bar_calculates_tab_total()
    @bar.open_tab(@guest_1)
    @bar.add_to_tab(@guest_1, @drink_1)
    @bar.add_to_tab(@guest_1, @drink_1)
    assert_equal(6.00, @bar.tab_total(@guest_1))
  end

  def test_bar_gets_payment()
    @bar.open_tab(@guest_1)
    @bar.add_to_tab(@guest_1, @drink_1)
    @bar.add_to_tab(@guest_1, @drink_1)
    @bar.get_payment(@bar.tab_total(@guest_1))
    assert_equal(6.00, @bar.till())
  end

  def test_bar_closes_tab()
    @bar.open_tab(@guest_1)
    @bar.open_tab(@guest_2)
    @bar.add_to_tab(@guest_1, @drink_1)
    @bar.close_tab(@guest_1)
    assert_equal([{guest: @guest_2, drinks: []}], @bar.tabs())
  end

 end
