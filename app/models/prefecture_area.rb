class PrefectureArea
  include ApplicationMemoryRecord
  memory_record [
    {key: "北海道・東北", },
    {key: "関東",         },
    {key: "信越・北陸",   },
    {key: "東海",         },
    {key: "近畿",         },
    {key: "中国",         },
    {key: "四国",         },
    {key: "九州・沖縄",   },
  ]

  def prefectures
    @prefectures ||= Prefecture.find_all {|e| e.area_name.to_sym == key }
  end
end
