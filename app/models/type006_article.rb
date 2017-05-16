# -*- coding: utf-8 -*-
# == Schema Information ==
#
# チェックボックスで複数項目設定1テーブル (type006_articles as Type006Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | name       | 名前     | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

class Type006Article < ApplicationRecord
  has_many :type006_team_ships, dependent: :destroy
  has_many :teams, through: :type006_team_ships

  with_options(presence: true) do
    validates :name
  end
end
