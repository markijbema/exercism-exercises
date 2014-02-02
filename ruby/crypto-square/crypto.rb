class Crypto
  def initialize plain
    @plain = plain
  end

  def ciphertext
    lines = plaintext_segments.map(&:chars)
    zip(lines).flatten.compact.join
  end

  def ciphertext
    chars = normalize_plaintext.chars
    square_side = Math.sqrt(chars.length).ceil

    transposed_indices = (square_side**2).times.map do |i|
      q, r = i.divmod(square_side)
      r * square_side + q
    end

    chars.values_at(*transposed_indices).join
  end

  def normalize_ciphertext
    segment(ciphertext, 5).join(' ')
  end

  def normalize_plaintext
    @plain.gsub(/\W/,'')
          .downcase
  end

  def plaintext_segments
    segment(normalize_plaintext, size)
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  private

  def segment s, segment_size
    s.scan(/.{1,#{segment_size}}/).to_a
  end

  def zip arr_of_arrs
    first, *rest = *arr_of_arrs
    first.zip(*rest)
  end
end
