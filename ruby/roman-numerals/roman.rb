class Fixnum
  ROMAN_CONVERSION = {
    1000 =>  'M',
    900  => 'CM',
    500  =>  'D',
    400  => 'CD',
    100  =>  'C',
    90   => 'XC',
    50   =>  'L',
    40   => 'XL',
    10   =>  'X',
    9    => 'IX',
    5    =>  'V',
    4    => 'IV',
    1    =>  'I',
  }.freeze

  def to_roman
    remainder = self
    roman_number = ''

    ROMAN_CONVERSION.each do |arabic_value, roman_value|
      (times, remainder) = remainder.divmod(arabic_value)
      roman_number << roman_value * times
    end

    roman_number
  end
end
