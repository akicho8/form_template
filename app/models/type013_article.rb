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

class Type013Article < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  # 相手のモデルに対して設定する内容
  # ここでは自分に対してもコメントできるようにしている
  has_many :comments, -> { order(:created_at) }, as: :commentable, class_name: name, dependent: :destroy, inverse_of: :commentable
  accepts_nested_attributes_for :comments, reject_if: proc { |attributes| attributes[:comment].blank? }, allow_destroy: true
end
