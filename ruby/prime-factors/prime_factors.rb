module PrimeFactors

  def self.for nr
    return to_enum(:for, nr).to_a unless block_given?

    divisor = 2
    rest = nr

    while rest > 1
      while rest % divisor == 0
        yield divisor
        rest /= divisor
      end
      divisor += 1
    end
  end
end
