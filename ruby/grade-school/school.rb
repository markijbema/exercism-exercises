class School
  attr_reader :db

  def initialize
    @db = Hash.new { [] }
  end

  def add name, grade
    @db[grade] <<= name
  end

  def grade level
    @db[level]
  end

  def db
    @db
  end

  def sort
    @db.sort.each_with_object({}) do |(grade, pupils), sorted|
      sorted[grade] = pupils.sort
    end
  end
end
