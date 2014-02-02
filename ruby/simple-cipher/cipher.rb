class Cipher
  ALPHABET = ('a'..'z').to_a

  def initialize key=create_key
    @key = key
    validate
  end

  def validate
    unless key.length > 0
      raise ArgumentError, "Key too short"
    end
    unless key.chars.all? {|c| ALPHABET.include? c }
      raise ArgumentError, "Invalid characters in key"
    end
  end

  attr_reader :key

  def encode message
    recode(message) { |plain, shift| plain + shift }
  end

  def decode message
    recode(message) { |cipher, shift| cipher - shift }
  end

  def recode message
    message.chars.zip(key.chars.cycle).map do |message_char, shift_char|
      message_position = to_position(message_char)
      shift_position   = to_position(shift_char)

      recoded_position = yield(message_position, shift_position)

      to_char(recoded_position)
    end.join
  end

  def to_position char
    ALPHABET.index(char)
  end

  def to_char position
    ALPHABET[position % ALPHABET.length]
  end

  def create_key
    100.times.map { ALPHABET.sample }.join
  end
end
