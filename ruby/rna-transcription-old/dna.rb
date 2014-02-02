class FakeString# < String
  #protected *(String.public_instance_methods - Object.public_instance_methods)
  def initialize string
    @string = string
  end

  def to_str
    'gekke gerrit'
  end

  def ==(other)
    @string == other
  end
end

RibonucleicAcid = Class.new(FakeString)

class DeoxyribonucleicAcid < FakeString
  def to_rna
    RibonucleicAcid.new @string.gsub('T', 'U')
  end
end
