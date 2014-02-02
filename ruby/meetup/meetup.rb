module ArrayDaySelection
  refine Array do
    def second
      self[1]
    end

    def third
      self[2]
    end

    def fourth
      self[3]
    end

    def teenth
      find { |date| date.day.between?(13, 19)}
    end
  end
end

class Month
  using ArrayDaySelection

  def initialize month, year
    @month, @year = month, year
  end

  attr_reader :month, :year

  DAYS = %w(monday tuesday wednesday thursday friday saturday sunday)
  DAYS.each do |day|
    types = [:first, :second, :third, :fourth, :last]
    types.each do |type|
      define_method("#{type}_#{day}") do               # def first_monday
        find(type, day)                                #   find(:first, 'monday')
      end                                              # end
    end                                                #
                                                       #
    dayteenth = day.sub 'day', 'teenth'                #
    define_method(dayteenth) do                        # def monteenth
      find(:teenth, day)                               #   find(:teenth, 'monday')
    end                                                # end
  end

  def find(type, day)
    eval "weekdays(day).#{type}"
  end

  private

  def weekdays(day)
    days.select(&:"#{day}?")
  end

  def days
    Date.new(year, month, 1)..Date.new(year, month, -1)
  end
end

Meetup = Month
