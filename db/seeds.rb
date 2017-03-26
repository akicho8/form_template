if SevenDay.all.empty?
  "日月火水木金土".chars.each do |e|
    p SevenDay.create!(:name => e)
  end
end
