unless Team.exists?
  "ABC".chars.each do |e|
    p Team.create!(:name => e)
  end
end

unless Type017Article.exists?
  [
    "広島県広島市北区大宮",
    "広島県広島市西区天満町16-4",
    "東京都渋谷区鴬谷町",
    "東京都世田谷区三軒茶屋",
    "東京都世田谷区太子堂",
    "東京都世田谷区若林2丁目",
    "広島県尾道市土堂2丁目4土堂2ｰ4ｰ9",
  ].each do |e|
    p Type017Article.create!(:map_address => e)
  end
end

unless Type029Article.exists?
  p Type029Article.create!
end
