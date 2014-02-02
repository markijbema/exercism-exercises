class Luhn
  def self.create number
    self.new(number*10).fix_checksum
  end

  def initialize number
    @number = number
  end

  def addends
    digits.reverse.each_with_index.map do |digit, index|
      if index.odd?
        digit *= 2
        digit -= 9 if digit >= 10
      end
      digit
    end.reverse
  end

  def checksum
    addends.inject(:+)
  end

  def correct_checksum
    (10 - self.checksum) % 10
  end

  def fix_checksum
    digits.take(digits.length-1)
          .<<(correct_checksum)
          .join.to_i
  end

  def valid?
    checksum % 10 == 0
  end

  private

  def digits
    @number.to_s.chars.map(&:to_i)
  end
end
