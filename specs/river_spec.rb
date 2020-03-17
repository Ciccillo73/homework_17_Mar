require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../fish')
require_relative('../river')

class TestRiver < MiniTest::Test
	def setup
		@fish1 = Fish.new("Nemo")
    @fish2 = Fish.new("Betty")
    @fish3 = Fish.new("Jill")

    @river = River.new("Amazon",[@fish1, @fish2, @fish3])

	end

	def test_has_name()
		assert_equal("Amazon", @river.name)
	end

	def test_default_state()
		assert_equal(3, @river.count_fish())
	end

	def test_can_get_fish()
		fish = @river.get_fish
		assert_equal(@fish1.name, fish.name())
	end

	def test_no_fish_in_river()
		fish = @river.get_fish
		fish = @river.get_fish
		fish = @river.get_fish
		empty_river = @river.get_fish
		assert_nil(empty_river)
	end
end
