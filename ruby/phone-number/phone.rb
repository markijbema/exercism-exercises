require 'delegate'

class Phone < SimpleDelegator
  def initialize input_string
    super PhoneNumberParser.new(input_string).parsed
  end
end

class PhoneNumberParser
  def initialize input_string
    @input_string = input_string
  end

  def parsed
    if parsed_international.valid?
      parsed_international
    elsif parsed_national.valid?
      parsed_national
    else
      InvalidDigits.new
    end
  end

  private

  def parsed_national
    USPhoneNumberDigits.new(digits)
  end

  def parsed_international
    type = USPhoneNumberDigits

    if digits.take(type.prefix.length) == type.prefix
      type.new(digits.drop(type.prefix.length))
    else
      InvalidDigits.new
    end
  end

  def digits
    @input_string.delete('^0-9')
     .chars.map(&:to_i)
  end
end

class InvalidDigits
  def to_s
    ''
  end

  def number
    '0'*10
  end

  def area_code
    nil
  end

  def valid?
    false
  end
end

USPhoneNumberDigits = Struct.new(:digits) do
  LENGTH = 10

  def to_s
    format_as "(xxx) xxx-xxxx"
  end

  def number
    digits.join
  end

  def self.prefix
    [1]
  end

  def valid?
    digits.length == LENGTH
  end

  def area_code
    digits.take(3).join
  end

  private

  def format_as(formatting)
    format formatting.gsub('x', '%d'), *digits
  end
end
