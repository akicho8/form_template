# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 件名と本文のみテーブル (type035_articles as Type035Article)
#
# |----------+------+---------+-------------+------+-------|
# | カラム名 | 意味 | タイプ  | 属性        | 参照 | INDEX |
# |----------+------+---------+-------------+------+-------|
# | id       | ID   | integer | NOT NULL PK |      |       |
# | position | 順序 | integer |             |      |       |
# |----------+------+---------+-------------+------+-------|

class Type035Article < ApplicationRecord
  default_scope { order(:position) }
  acts_as_list

  # モデル側で動かす場合 (うまくいかない)
  concerning :MovableMethods do
    included do
      # attr_accessor を使ってはいけない。親モデルだといいけど accepts_nested_attributes_for 経由だと値を渡せないのではまる。
      attribute :move_arrow

      after_save do
        if move_arrow
          send(move_arrow)
          self.move_arrow = nil
        end
      end
    end
  end
end
