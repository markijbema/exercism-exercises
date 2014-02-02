    class FakeString
      def initialize string
        @string = string
      end

      def to_str
        'i must exist, but i am not actually used'
      end

      def ==(other)
        @string == other
      end
    end


    fake = FakeString.new('a')

    puts 'a' == fake # true
    puts fake == 'a' # true
    puts 'b' == fake # false
    puts fake == 'b' #false
