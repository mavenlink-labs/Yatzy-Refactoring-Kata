class Yatzy
  def initialize(dice1, dice2, dice3, dice4, dice5)
    @dice = [dice1, dice2, dice3, dice4, dice5]
    @tallies = tallies
  end

  def tallies
    tallies = [0] * 7
    @dice.each do |die|
      tallies[die] += 1
    end
    tallies
  end

  def chance
    sum = 0
    @dice.each { |die| sum += die }
    sum
  end

  def yatzy
    @tallies.include?(5) ? 50 : 0
  end

  def add_of_a_kind(value)
    sum = 0
    @dice.each do |die|
      sum += die if die == value
    end
    sum
  end

  def score_of_a_kind(number)
    [6, 5, 4, 3, 2, 1].each do |value|
      return value * number if @tallies[value] >= number
    end
    0
  end

  def score_pair
    score_of_a_kind(2)
  end

  def three_of_a_kind
    score_of_a_kind(3)
  end

  def four_of_a_kind
    score_of_a_kind(4)
  end

  def two_pair
    n = 0
    score = 0
    [5, 4, 3, 2, 1].each do |value|
      if @tallies[value] >= 2
        score += value
        n += 1
        return score * 2 if n == 2
      end
    end
    0
  end

  def small_straight
    (1..5).each do |value|
      return 0 if tallies[value] != 1
    end
    15
  end

  def large_straight
    (2..6).each do |value|
      return 0 if tallies[value] != 1
    end
    20
  end

  def full_house
    two_pair = @tallies.find_index(2)
    three_pair = @tallies.find_index(3)

    return two_pair * 2 + three_pair * 3 if two_pair && three_pair

    0
  end
end
