module CleanText
  def self.getsmall
    text = gets.chomp
    if text == ""
      ""
    else
      text.split("").first.downcase
    end
  end
end
