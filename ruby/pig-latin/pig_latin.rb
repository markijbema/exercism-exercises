module PigLatin
  def self.translate phrase
    phrase.gsub(WORD, &method(:translate_word))
  end

  WORD = /\p{L}+/
  VOWEL_START = Regexp.union(
    /^[aeiou]/,
    /^[yx][^aeiou]/
  )
  CONSONANT_START = Regexp.union(
    /^[^aeiou]*qu/,
    /^[^aeiou]+/
  )
  private_constant :WORD, :VOWEL_START, :CONSONANT_START
  private

  def self.translate_word word
    case word
    when VOWEL_START
      word + "ay"
    when CONSONANT_START
      beginning, rest = Regexp.last_match, Regexp.last_match.post_match
      "#{rest}#{beginning}ay"
    else
      word
    end
  end
end
