TriangleError = Class.new(StandardError)

class Triangle
  def initialize side1, side2, side3
    @sides = [side1, side2, side3]

    assert "Sides have a positive length",
           sides.all? {|side| side > 0 }
    assert "Sides obey the triangle inequality",
           sides.inject(:+) - sides.max > sides.max
  end

  attr_reader :sides

  def kind
    case number_of_equal_sides
    when 3
      :equilateral
    when 2
      :isosceles
    when 0
      :scalene
    end
  end

  private

  def assert message, success
    success or fail TriangleError, "Failed assertion: #{message}"
  end

  def number_of_equal_sides
    equal_sides = 4 - sides.uniq.length

    equal_sides == 1 ? 0 : equal_sides
  end
end
