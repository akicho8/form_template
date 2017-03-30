# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 件名と本文の画像認証対応の親切版テーブル (type015_articles as Type015Article)
#
# +------------+--------------+----------+-------------+------+-------+
# | カラム名   | 意味         | タイプ   | 属性        | 参照 | INDEX |
# +------------+--------------+----------+-------------+------+-------+
# | id         | ID           | integer  | NOT NULL PK |      |       |
# | subject    | 件名         | string   |             |      |       |
# | body       | 内容         | text     |             |      |       |
# | remote_ip  | アクセス元IP | string   |             |      |       |
# | created_at | 作成日時     | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時     | datetime | NOT NULL    |      |       |
# +------------+--------------+----------+-------------+------+-------+

class Type015Article < ApplicationRecord
  apply_simple_captcha add_to_base: true
end
