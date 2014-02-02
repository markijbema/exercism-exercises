class Trinary
  def initialize trinary
    @trinary = trinary
  end

  def to_decimal
    digits.each_with_index
          .map { |digit, position| digit * 3**position }
          .reduce(:+)
  end

  def digits
    @trinary.chars.map(&:to_i).reverse
  end
end
