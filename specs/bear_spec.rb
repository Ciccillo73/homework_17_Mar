require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bear')
require_relative('../fish')
require_relative('../river')

class BearTest < MiniTest::Test

  def setup()
    @bear = Bear.new("Boo-Boo", "anthropomorphic")

    @fish1 = Fish.new("Nemo")
    @fish2 = Fish.new("Betty")
    @fish3 = Fish.new("Jill")

    @river = River.new("Amazon",[@fish1, @fish2, @fish3])

  end

  def test_bear_name()
    assert_equal("Boo-Boo", @bear.name)
  end

  def test_has_race()
    assert_equal("anthropomorphic", @bear.type)
  end

  def test_can_have_a_bad_day!()
    assert_equal("Rooooar!" ,@bear.roar())
  end

  def test_empy_stomach()
    assert_equal(0, @bear.food_count)
  end

  def test_can_take_fish_from_river()
    @bear.take_fish(@river)
    assert_equal(1, @bear.food_count())
    assert_equal(2, @river.count_fish())
  end

  def test_cant_take_fish_form_empty_river()
    another_river = River.new("Gange", [])
    @bear.take_fish(another_river)
    assert_equal(0, @bear.food_count())
    assert_equal(0, another_river.count_fish())
  end

  def test_bear_endangered()
    @river.get_fish()
    @river.get_fish()
    @river.get_fish()
    another_river = River.new("Gange", [])
    assert_equal(0, @river.count_fish())
    assert_equal(0, another_river.count_fish())
    assert_equal(0, @bear.food_count())
  end
end
