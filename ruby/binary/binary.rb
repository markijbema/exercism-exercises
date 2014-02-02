class Binary
  def initialize binary_string
    @digits = string_to_digits(binary_string)
  end

  attr_reader :digits

  def to_decimal
    digits.reduce(0) do |result, binary_decimal|
      result * 2 + binary_decimal
    end
  end

  private

  def string_to_digits binary_string
    case binary_string
    when /\A[01]+\z/
      binary_string.chars.map(&:to_i)
    else
      []
    end
  end
end
