# -*- coding: utf-8 -*-
# == Schema Information ==
#
# リンクとコンテンツを混ぜた並び替え (type036_ships as Type036Ship)
#
# |------------------+----------------------------+-------------+-------------+----------------------------+-------|
# | name             | desc                       | type        | opts        | refs                       | index |
# |------------------+----------------------------+-------------+-------------+----------------------------+-------|
# | id               | Id                         | integer(8)  | NOT NULL PK |                            |       |
# | guide_id         | Guide                      | integer(8)  | NOT NULL    | => Guide#id                | A     |
# | reorderable_type | 並び替え対象レコードタイプ | string(255) | NOT NULL    | SpecificModel(polymorphic) | B     |
# | reorderable_id   | 並び替え対象レコードID     | integer(8)  | NOT NULL    | => (reorderable_type)#id   | B     |
# | group_key        | グループ                   | string(255) | NOT NULL    |                            |       |
# | position         | 並び替え順序番号           | integer(4)  |             |                            |       |
# | created_at       | 作成日時                   | datetime    | NOT NULL    |                            |       |
# | updated_at       | 更新日時                   | datetime    | NOT NULL    |                            |       |
# |------------------+----------------------------+-------------+-------------+----------------------------+-------|
#
#- Remarks ----------------------------------------------------------------------
# Guide.has_many :routes
#--------------------------------------------------------------------------------

class CreateType036Ships < ActiveRecord::Migration[5.1]
  def change
    create_table :type036_ships do |t|
      t.belongs_to :reorderable, polymorphic: true, null: false
      t.integer :position
      t.timestamps
    end

    create_table :type0361_articles do |t|
      t.string :name
    end

    create_table :type0362_articles do |t|
      t.string :name
    end
  end
end
