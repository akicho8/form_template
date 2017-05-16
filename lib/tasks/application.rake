task list: :environment do
  tt LuckyBeast.collect { |e| {key: e.search_key, name: e.name, desc: e.desc } }
end
