# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 住所からGoogleマップ表示テーブル (type017_articles as Type017Article)
#
# +--------------+----------+----------+-------------+------+-------+
# | カラム名     | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +--------------+----------+----------+-------------+------+-------+
# | id           | ID       | integer  | NOT NULL PK |      |       |
# | map_address  | 住所     | string   |             |      |       |
# | geocode_hash | 住所情報 | text     |             |      |       |
# | created_at   | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at   | 更新日時 | datetime | NOT NULL    |      |       |
# +--------------+----------+----------+-------------+------+-------+

module Type017ArticlesHelper
end
