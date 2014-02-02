class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def anagram_of?(other)
    self.letters == other.letters &&
       self.word != other.word
  end

  def match words
    words.select do |word|
      anagram_of?(Anagram.new(word))
    end
  end

  protected

  attr_reader :word

  def letters
    @letters ||= word.chars.sort
  end
end
