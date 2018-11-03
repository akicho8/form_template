task list: :environment do
  tt RbCodeArticle.collect { |e| {key: e.search_key, name: e.name, desc: e.desc } }
end
