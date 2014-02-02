BottlesOfBeer = Struct.new(:number) do
  def to_s
    case number
    when 1 then "1 bottle"
    when 0 then "no more bottles"
    else        "#{number} bottles"
    end
  end

  def on_the_wall
    of_beer + " on the wall"
  end

  def of_beer
    self.to_s + " of beer"
  end

  def take_down
    "take #{one} down and pass it around"
  end

  def one
    number == 1 ? 'it' : 'one'
  end

  def +(plus)
    BottlesOfBeer.new(number+plus)
  end

  def -(minus)
    self + (-minus)
  end
end

class Song
  def initialize events
    @events = events
  end

  def to_s
    verses.join("\n")
  end

  def verses
    lines.each_slice(2).map do |verse_lines|
      verse_lines.join ''
    end
  end

  def lines
    @events.each_slice(2).map do |first, last|
      "#{first.capitalize}, #{last}.\n"
    end
  end

end

class GoodNightDrinking
  def initialize number
    @events = []
    @bottles = BottlesOfBeer.new(number)
  end

  def to_s
    Song.new(@events).to_s
  end

  def round
    beer_left = count_beers
    beer_left = count_beers_again

    if beer_left > 0
      take_on_down
    else
      buy_some_more
    end

    beer_left = count_beers
  end

  def count_beers
    @events << @bottles.on_the_wall
    @bottles.number
  end

  def count_beers_again
    @events << @bottles.of_beer
    @bottles.number
  end

  def take_on_down
    @events << @bottles.take_down
    @bottles -= 1
  end

  def buy_some_more(some=99)
    @events << "go to the store and buy some more"
    @bottles += some
  end
end

class Beer
  def verse nr
    verse = GoodNightDrinking.new(nr)
    verse.round
    verse.to_s
  end

  def sing from, to = 0
    verse = GoodNightDrinking.new(from)
    (from - to + 1).times { verse.round }
    verse.to_s + "\n"
  end
end
