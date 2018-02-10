require("minitest/autorun")
require_relative("../drink")

class TestDrink < MiniTest::Test

  def setup()
    @drink_1 = Drink.new("beer", 3.00)
  end

  def test_drink_has_name()
    assert_equal("beer", @drink_1.name())
  end

  def test_drink_has_price()
    assert_equal(3.00, @drink_1.price())
  end

end
