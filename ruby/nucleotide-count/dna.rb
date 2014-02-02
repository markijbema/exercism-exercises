class DNA
  def initialize strand
    @strand = strand
  end

  def count nucleotide
    raise ArgumentError unless NUCLEOTIDES.include? nucleotide

    @strand.count(nucleotide)
  end

  def nucleotide_counts
    nucleotides = (NUCLEOTIDES - ['U'])
    counts = nucleotides.map(&method(:count))
    Hash[nucleotides.zip(counts)]
  end

  NUCLEOTIDES = [ 'A', 'T', 'C', 'G', 'U' ]
end
