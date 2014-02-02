class Robot
  def initialize
    reset
  end

  def reset
    @name = RandomName.next
  end

  attr_reader :name
end

class RandomName
  def self.next
    @name_creator ||= new
    @name_creator.next
  end

  def next
    chars.join
  end

  private

  def chars
    sample('A'..'Z', take: 2) +
      sample('0'..'9', take: 3)
  end

  def sample(choices, take: 1)
    choices.to_a.sample(take)
  end
end
