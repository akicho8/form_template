class LocaleInfo
  include ApplicationMemoryRecord
  memory_record [
    { key: :ja, name: "日本語", },
    { key: :en, name: "英語",   },
  ]
end
