# -*- coding: utf-8 -*-
# == Schema Information ==
#
# HTML5の機能確認テーブル (type014_articles as Type014Article)
#
# |-------------------+------------------+----------+-------------+------+-------|
# | カラム名          | 意味             | タイプ   | 属性        | 参照 | INDEX |
# |-------------------+------------------+----------+-------------+------+-------|
# | id                | ID               | integer  | NOT NULL PK |      |       |
# | date_v            | date             | datetime |             |      |       |
# | datetime_v        | datetime         | datetime |             |      |       |
# | datetime_v_ymdhms | YYYMMDD HH:MM:SS | datetime |             |      |       |
# | datetime_v_ymdhm  | YYMMDD HH:MM     | datetime |             |      |       |
# | datetime_v_ymdh   | YYMMDD HH:00     | datetime |             |      |       |
# | datetime_v_ymd    | YYMMDD 00:00     | datetime |             |      |       |
# | month_v           | month            | datetime |             |      |       |
# | week_v            | week             | datetime |             |      |       |
# | time_v            | time             | datetime |             |      |       |
# | range_v           | range            | integer  |             |      |       |
# | tel_v             | tel              | string   |             |      |       |
# | url_v             | url              | string   |             |      |       |
# | email_v           | email            | string   |             |      |       |
# | color_v           | color            | string   |             |      |       |
# | created_at        | 作成日時         | datetime | NOT NULL    |      |       |
# | updated_at        | 更新日時         | datetime | NOT NULL    |      |       |
# |-------------------+------------------+----------+-------------+------+-------|

class Type014Article < ApplicationRecord
  # "2017-W02" は受け付けないため
  def week_v=(v)
    super(v.to_date)
  end

  # "2017-03" は受け付けないため
  def month_v=(v)
    if v.present?
      super("#{v}-01")
    end
  end
end
