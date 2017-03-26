# -*- coding: utf-8 -*-
# == Schema Information ==
#
# HTML5の機能確認テーブル (type014_articles as Type014Article)
#
# +------------------+------------------------------+----------+-------------+------+-------+
# | カラム名         | 意味                         | タイプ   | 属性        | 参照 | INDEX |
# +------------------+------------------------------+----------+-------------+------+-------+
# | id               | ID                           | integer  | NOT NULL PK |      |       |
# | date_v           | 日付(date)                   | datetime |             |      |       |
# | datetime_v       | 日時(datetime)               | datetime |             |      |       |
# | datetime_local_v | ローカル日時(datetime-local) | datetime |             |      |       |
# | month_v          | 年月(month)                  | datetime |             |      |       |
# | week_v           | 年週(week)                   | datetime |             |      |       |
# | time_v           | 時間(time)                   | datetime |             |      |       |
# | range_v          | 範囲(range)                  | integer  |             |      |       |
# | tel_v            | 電話(tel)                    | string   |             |      |       |
# | url_v            | URL(url)                     | string   |             |      |       |
# | email_v          | メールアドレス(email)        | string   |             |      |       |
# | color_v          | 色(color)                    | string   |             |      |       |
# | created_at       | 作成日時                     | datetime | NOT NULL    |      |       |
# | updated_at       | 更新日時                     | datetime | NOT NULL    |      |       |
# +------------------+------------------------------+----------+-------------+------+-------+

class CreateType014Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type014_articles, :force => true do |t|
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
      t.datetime :datetime_local_v
      t.datetime :month_v
      t.datetime :week_v
      t.datetime :time_v
      t.integer :range_v
      t.string :tel_v
      t.string :url_v
      t.string :email_v
      t.string :color_v

      t.timestamps :null => false
    end
  end
end
