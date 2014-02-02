PhoneNumber.areacode_of(number)

Phonenumber.new(number).areacode

class PhoneNumber
  def initialize digits
    @digits = digits
  end

  def areacode
    @digits[0,3]
  end
end


rules:

- only the initialize modifies the class
- every method is a function from the state of the object to a value or a new object following these rules
c



use array as minimal version of a
