module ETL
  def self.transform old_hash
    old_hash.each_with_object({}) do |(old_key, old_values), new_hash|
      old_values.each do |old_value|
        new_hash[old_value.downcase] = old_key
      end
    end
  end
end
