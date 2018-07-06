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

module NameSpace1
  class Type014ArticlesController < ApplicationController
    include ModulableCrud::AllWithConfirm

    def raw_current_record
      super.tap do |e|
        # e.date_v           ||= Time.zone.parse("2017-01-01 12:34")
        # e.datetime_v       ||= Time.zone.parse("2017-01-01 12:34")
        # e.datetime_local_v ||= Time.zone.parse("2017-01-01 12:34")
        # e.month_v          ||= Time.zone.parse("2017-01-01 12:34")
        # e.week_v           ||= Time.zone.parse("2017-01-01 12:34")
        # e.time_v           ||= Time.zone.parse("2017-01-01 12:34")
        # e.range_v          ||= Time.zone.parse("2017-01-01 12:34")
        # e.tel_v            ||= "090-1234-5678"
        # e.url_v            ||= "http://www.google.co.jp/"
        # e.email_v          ||= "foo@bar.com"
        # e.color_v          ||= "#FF0000"
      end
    end
  end
end
