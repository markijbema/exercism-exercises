module ExtraHashOperations
  refine Hash do
    def +(other)
      sum = ->(_, count1, count2) { count1 + count2 }

      merge(other, &sum)
    end
  end
end

class Phrase
  using ExtraHashOperations

  def initialize content
    @content = content
  end

  def word_count
    words.reduce({}) do |count, word|
      count + { word => 1 }
    end
  end

  def words
    @content.downcase.scan(/\w+/)
  end
end
