# -*- coding: utf-8 -*-
# == Schema Information ==
#
# ファイル1つの情報テーブル (type005_files as Type005File)
#
# |--------------------+-----------------+----------+-------------+----------------------+-------|
# | カラム名           | 意味            | タイプ   | 属性        | 参照                 | INDEX |
# |--------------------+-----------------+----------+-------------+----------------------+-------|
# | id                 | ID              | integer  | NOT NULL PK |                      |       |
# | type005_article_id | Type005 article | integer  |             | => Type005Article#id | A     |
# | media_file         | ファイル        | string   |             |                      |       |
# | created_at         | 作成日時        | datetime | NOT NULL    |                      |       |
# | updated_at         | 更新日時        | datetime | NOT NULL    |                      |       |
# |--------------------+-----------------+----------+-------------+----------------------+-------|
#
#- 備考 -------------------------------------------------------------------------
# ・Type005File モデルは Type005Article モデルから has_many :type005_files されています。
#--------------------------------------------------------------------------------

class Type005File < ApplicationRecord
  mount_uploader :media_file, AttachmentUploader

  belongs_to :type005_article, inverse_of: :type005_files
  acts_as_list scope: :type005_article, top_of_list: 0

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
