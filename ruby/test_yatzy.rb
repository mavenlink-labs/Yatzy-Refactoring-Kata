require_relative 'yatzy'
require 'test/unit'

class YatzyTest < Test::Unit::TestCase
  def test_chance_scores_sum_of_all_dice
    expected = 15
    actual = Yatzy.new(2,3,4,5,1).chance
    assert expected == actual
    assert 16 == Yatzy.new(3,3,4,5,1).chance
  end

  def test_yatzy_scores_50
    expected = 50
    actual = Yatzy.new(4,4,4,4,4).yatzy
    assert expected == actual
    assert 50 == Yatzy.new(6,6,6,6,6).yatzy
    assert 0 == Yatzy.new(6,6,6,6,3).yatzy
  end

  def test_1s
    assert Yatzy.new(1, 2, 3, 4, 5).addOfAKind(1) == 1
    assert 2 == Yatzy.new(1,2,1,4,5).addOfAKind(1)
    assert 0 == Yatzy.new(6,2,2,4,5).addOfAKind(1)
    assert 4 == Yatzy.new(1,2,1,1,1).addOfAKind(1)
  end

  def test_2s
    assert Yatzy.new(1,2,3,2,6).addOfAKind(2) == 4
    assert Yatzy.new(2,2,2,2,2).addOfAKind(2) == 10
  end

  def test_threes
    assert 6 == Yatzy.new(1,2,3,2,3).addOfAKind(3)
    assert 12 == Yatzy.new(2,3,3,3,3).addOfAKind(3)
  end

  def test_fours_test
    assert 12 == Yatzy.new(4,4,4,5,5).addOfAKind(4)
    assert 8 == Yatzy.new(4,4,5,5,5).addOfAKind(4)
    assert 4 == Yatzy.new(4,5,5,5,5).addOfAKind(4)
  end

  def test_fives()
    assert 10 == Yatzy.new(4,4,4,5,5).addOfAKind(5)
    assert 15 == Yatzy.new(4,4,5,5,5).addOfAKind(5)
    assert 20 == Yatzy.new(4,5,5,5,5).addOfAKind(5)
  end

  def test_sixes_test
    assert 0 == Yatzy.new(4,4,4,5,5).addOfAKind(6)
    assert 6 == Yatzy.new(4,4,6,5,5).addOfAKind(6)
    assert 18 == Yatzy.new(6,5,6,6,5).addOfAKind(6)
  end

  def test_one_pair
    assert 6 == Yatzy.new(3, 4, 3, 5, 6).score_pair(3,4,3,5,6)
    assert 10 == Yatzy.new(5, 3, 3, 3, 5).score_pair(5,3,3,3,5)
    assert 12 == Yatzy.new(5, 3, 6, 6, 5).score_pair(5,3,6,6,5)
  end

  def test_two_Pair
    assert_equal 16, Yatzy.new(3,3,5,4,5).two_pair(3,3,5,4,5)
    assert_equal 16, Yatzy.new(3,3,5,4,5).two_pair(3,3,5,5,5)
  end

  def test_three_of_a_kind()
    assert 9 == Yatzy.new(3,3,3,4,5).three_of_a_kind(3,3,3,4,5)
    assert 15 == Yatzy.new(5,3,5,4,5).three_of_a_kind(5,3,5,4,5)
    assert 9 == Yatzy.new(3,3,3,3,5).three_of_a_kind(3,3,3,3,5)
  end

  def test_four_of_a_knd
    assert 12 == Yatzy.new(3,3,3,3,5).four_of_a_kind(3,3,3,3,5)
    assert 20 == Yatzy.new(5,5,5,4,5).four_of_a_kind(5,5,5,4,5)
    assert 9 == Yatzy.new(3,3,3,3,3).three_of_a_kind(3,3,3,3,3)
    assert 12 == Yatzy.new(3,3,3,3,3).four_of_a_kind(3,3,3,3,3)
  end

  def test_smallStraight()
    assert 15 == Yatzy.new(1,2,3,4,5).smallStraight(1,2,3,4,5)
    assert 15 == Yatzy.new(2,3,4,5,1).smallStraight(2,3,4,5,1)
    assert 0 == Yatzy.new(1,2,2,4,5).smallStraight(1,2,2,4,5)
  end

  def test_largeStraight
    assert 20 == Yatzy.new(6,2,3,4,5).largeStraight(6,2,3,4,5)
    assert 20 == Yatzy.new(2,3,4,5,6).largeStraight(2,3,4,5,6)
    assert 0 == Yatzy.new(1,2,2,4,5).largeStraight(1,2,2,4,5)
  end

  def test_fullHouse()
    assert 18 == Yatzy.new(6,2,2,2,6).fullHouse()
    assert 0 == Yatzy.new(2,3,4,5,6).fullHouse()
  end
end
