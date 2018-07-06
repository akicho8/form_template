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

class CreateType014Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type014_articles, force: true do |t|
      # date: <input type="date" /><br/>
      # datetime: <input type="datetime" /><br/>
      # datetime-local: <input type="datetime-local" /><br/>
      # month: <input type="month" /><br/>
      # week: <input type="week" /><br/>
      # time: <input type="time" /><br/>
      # number: <input type="number" /><br/>
      # range: <input type="range" /><br/>
      # search: <input type="search" /><br/>
      # tel: <input type="tel" /><br/>
      # url: <input type="url" /><br/>
      # email: <input type="email" /><br/>
      # color: <input type="color" /><br/>

      t.datetime :date_v
      t.datetime :datetime_v
      t.datetime :datetime_v_ymdhms
      t.datetime :datetime_v_ymdhm
      t.datetime :datetime_v_ymdh
      t.datetime :datetime_v_ymd
      t.datetime :month_v
      t.datetime :week_v
      t.datetime :time_v
      t.integer :range_v
      t.string :tel_v
      t.string :url_v
      t.string :email_v
      t.string :color_v

      t.timestamps null: false
    end
  end
end
