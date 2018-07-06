# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 住所からGoogleマップ表示テーブル (type017_articles as Type017Article)
#
# |--------------+----------+----------+-------------+------+-------|
# | カラム名     | 意味     | タイプ   | 属性        | 参照 | INDEX |
# |--------------+----------+----------+-------------+------+-------|
# | id           | ID       | integer  | NOT NULL PK |      |       |
# | map_address  | 住所     | string   |             |      |       |
# | geocode_hash | 住所情報 | text     |             |      |       |
# | created_at   | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at   | 更新日時 | datetime | NOT NULL    |      |       |
# |--------------+----------+----------+-------------+------+-------|

class Type017Article < ApplicationRecord
  serialize :geocode_hash

  with_options(presence: true) do
    validates :map_address
  end

  before_validation do
    if changes[:map_address] && map_address.present?
      geocode = Geokit::Geocoders::GoogleGeocoder.geocode(map_address) # オフラインでは例外がでず警告を表示する
      if geocode
        if geocode.success
          self.geocode_hash = geocode.to_hash
        else
          self.geocode_hash = nil
        end
      end
    end
  end
end
