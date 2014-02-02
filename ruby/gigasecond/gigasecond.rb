class Gigasecond
  def initialize start_date
    @start_date = start_date
  end

  def date
    @start_date + days_per_gigasecond
  end

  private

  def days_per_gigasecond
    gigasecond_in_seconds / seconds_per_day
  end

  def seconds_per_day
    24*60*60
  end

  def gigasecond_in_seconds
    1_000_000_000
  end
end
