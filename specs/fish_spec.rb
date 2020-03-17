require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


require_relative('../fish')


class FishTest < MiniTest::Test


  def test_has_name()
    fish = Fish.new("Nemo")
    assert_equal('Nemo', fish.name)
  end


end
