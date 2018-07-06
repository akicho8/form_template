# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 何にでもコメントできるモデルテーブル (type013_articles as Type013Article)
#
# |------------------+------------------+----------+-------------+--------------------------+-------|
# | カラム名         | 意味             | タイプ   | 属性        | 参照                     | INDEX |
# |------------------+------------------+----------+-------------+--------------------------+-------|
# | id               | ID               | integer  | NOT NULL PK |                          |       |
# | commentable_type | Commentable type | string   |             | モデル名(polymorphic)    | A     |
# | commentable_id   | Commentable      | integer  |             | => (commentable_type)#id | A     |
# | comment          | コメント         | string   | NOT NULL    |                          |       |
# | created_at       | 作成日時         | datetime | NOT NULL    |                          |       |
# | updated_at       | 更新日時         | datetime | NOT NULL    |                          |       |
# |------------------+------------------+----------+-------------+--------------------------+-------|

class CreateType013Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type013_articles, force: true do |t|
      t.belongs_to :commentable, polymorphic: true, null: true # 自分から初まる場合もあるため null 許可
      t.string :comment, null: false
      t.timestamps null: false
    end
  end
end
