SpaceAge = Struct.new(:seconds) do
  ORBITAL_PERIODS = {
    mercury: 0.2408467,
    venus: 0.61519726,
    earth: 1,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }

  ORBITAL_PERIODS.each do |planet, period|
    define_method("on_#{planet}") do      # def on_mercury
      (earth_years / period).round(2)     #   (earth_years / 0.2408467).round(2)
    end                                   # end
  end

  private

  def earth_years
    seconds.to_f / seconds_per_earth_year
  end

  def seconds_per_earth_year
    365.25 * 24 * 60 * 60
  end
end
