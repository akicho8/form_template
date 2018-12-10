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
  acts_as_list top_of_list: 0

  # モデル側で動かす場合
  concerning :MovableMethods do
    included do
      # attr_accessor を使ってはいけない。親モデルだといいけど accepts_nested_attributes_for 経由だと値を渡せないのではまる。
      attribute :move_to

      after_save do
        if v = move_to
          reload.send("move_#{v}")        # リロード重要
        end
      end
    end
  end
end
