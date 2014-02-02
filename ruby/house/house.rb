class House
  def verses from, to
    from.upto(to)
        .map { |nr| verse(nr) + "\n" }
        .join
  end

  def verse nr
    "This is " + introducee(nr) + ".\n"
  end

  private

  def introducee nr
    [
      "the horse and the hound and the horn that belonged to",
      "the farmer sowing his corn that kept",
      "the rooster that crowed in the morn that woke",
      "the priest all shaven and shorn that married",
      "the man all tattered and torn that kissed",
      "the maiden all forlorn that milked",
      "the cow with the crumpled horn that tossed",
      "the dog that worried",
      "the cat that killed",
      "the rat that ate",
      "the malt that lay in",
      "the house that Jack built",
    ].last(nr).join(' ')
  end
end
