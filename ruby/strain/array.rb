class Array
  def discard
    each_with_object([]) do |item, result|
      result << item unless yield(item)
    end
  end

  def keep
    each_with_object([]) do |item, result|
      result << item if yield(item)
    end
  end
end
