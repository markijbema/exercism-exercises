module Hamming
  def self.compute strand, other_strand
    minimum_length = [strand.length, other_strand.length].min

    minimum_length.times.count do |i|
      strand[i] != other_strand[i]
    end
  end
end
