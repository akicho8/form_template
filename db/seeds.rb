if Team.all.empty?
  "ABC".chars.each do |e|
    p Team.create!(:name => e)
  end
end
