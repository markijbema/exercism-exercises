class Array
  def accumulate_4
    Array.new(length) {|i| yield self[i]}
  end

  def accumulate_3
    accumulated = Array.new(length)
    for item in self
      accumulated.push yield(item)
    end
    accumulated
  end

  def accumulate_2
    accumulated = []
    for item in self
      accumulated.push yield(item)
    end
    accumulated
  end

  def accumulate_1
    accumulated = []
    self.each do |item|
      accumulated.push yield(item)
    end
    accumulated
  end

  alias :accumulate :accumulate_4
end

if __FILE__ == $PROGRAM_NAME
  require 'benchmark'
  numbers = Array.new(10_000_000) {|i| i % 16}
  Benchmark.bmbm do |yo|
    #         user     system      total        real
    # 4  10.760000   0.190000  10.950000 ( 10.971162)
    # 3  11.800000   0.530000  12.330000 ( 12.386697)
    # 2  11.260000   0.250000  11.510000 ( 11.550427)
    # 1  11.490000   0.260000  11.750000 ( 11.776797)
    yo.report("4") { 5.times { numbers.accumulate_4 {|x| x*x } } }
    yo.report("3") { 5.times { numbers.accumulate_3 {|x| x*x } } }
    yo.report("2") { 5.times { numbers.accumulate_2 {|x| x*x } } }
    yo.report("1") { 5.times { numbers.accumulate_1 {|x| x*x } } }
  end
end
