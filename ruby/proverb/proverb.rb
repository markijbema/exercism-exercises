class Proverb
  def initialize *needs, qualifier: nil
    @needs = needs
    @qualifier = qualifier
  end

  def to_s
    verses.inject(:+)
  end

  private

  def verses
    steps.map {|step| aggravation(*step) }
         .push(culmination)
  end

  def steps
    @needs.each_cons(2)
  end

  def aggravation(cause, effect)
    "For want of a #{cause} the #{effect} was lost.\n"
  end

  def culmination
    "And all for the want of a #{one_little_thing}."
  end

  def one_little_thing
    if @qualifier
      @qualifier + ' ' + @needs.first
    else
      @needs.first
    end
  end
end
