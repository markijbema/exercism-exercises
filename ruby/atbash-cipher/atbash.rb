module Atbash
  def self.encode plain
    chars = ('a'..'z').to_a.join
    plain.downcase
         .gsub(/\W/, '')
         .tr(chars, chars.reverse)
         .scan(/.{1,5}/).join(' ')
  end
end
