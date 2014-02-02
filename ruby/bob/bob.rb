class Statement
  def initialize content
    @content = content.to_s
  end

  def silence?
    @content.empty?
  end

  def question?
    @content.end_with? '?'
  end

  def yelling?
    @content == @content.upcase
  end
end

class Bob
  def hey input
    answer_to Statement.new(input)
  end

  def answer_to statement
    if statement.silence?
      "Fine. Be that way!"
    elsif statement.yelling?
      "Woah, chill out!"
    elsif statement.question?
      'Sure.'
    else
      "Whatever."
    end
  end
end
