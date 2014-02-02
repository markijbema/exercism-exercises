class Sieve
  def initialize number
    @sieve = Array.new(number) { true }
    @sieve[0] = false
    @sieve[1] = false
  end

  def primes
    sieve!

    @sieve.each_with_index
          .select { |is_prime, _| is_prime }
          .map { |_, number| number }
  end

  private

  def sieve!
    @sieve.length.times do |number|
      sieve_out!(number) if prime?(number)
    end
  end

  def sieve_out! number
    (number*2 .. @sieve.length).step(number) do |no_prime|
      @sieve[no_prime] = false
    end
  end

  def prime? number
    @sieve[number]
  end

end
