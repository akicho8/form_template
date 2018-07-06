# -*- coding: utf-8 -*-
# == Schema Information ==
#
# プルダウンのマルチセレクトで複数項目設定テーブル (type008_articles as Type008Article)
#
# |------------+----------+----------+-------------+------+-------|
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# |------------+----------+----------+-------------+------+-------|
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | name       | 名前     | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# |------------+----------+----------+-------------+------+-------|

class Type008Article < ApplicationRecord
  has_many :type008_team_ships, dependent: :destroy
  has_many :teams, through: :type008_team_ships

  with_options(presence: true) do
    validates :name
  end

  concerning :ConfirmMethods do
    included do
      include Type007Article::ConfirmMethods
    end
  end
end
