class TriangleInfo
  include ApplicationMemoryRecord
  memory_record [
    { key: :to_top,    name: "△", },
    { key: :higher,    name: "▲", },
    { key: :lower,     name: "▼", },
    { key: :to_bottom, name: "▽", },
  ]
end
