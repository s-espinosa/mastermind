module CleanText
  def self.getsmall
    gets.chomp.split("").first.downcase
  end
end
