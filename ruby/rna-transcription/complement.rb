# Module to calculate complements of rna/dna strings
module Complement
  DNA_COMPLEMENTS = ['CGTA', 'GCAU']

  def self.of_dna(strand)
    strand.tr *DNA_COMPLEMENTS
  end

  def self.of_rna(strand)
    strand.tr *DNA_COMPLEMENTS.reverse
  end
end
