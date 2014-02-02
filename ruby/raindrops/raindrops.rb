class Raindrops
  def convert nr
    sound = [
      *("Pling" if (nr % 3).zero?),
      *("Plang" if (nr % 5).zero?),
      *("Plong" if (nr % 7).zero?)
    ].inject(:+)

    sound || nr.to_s
  end
end
