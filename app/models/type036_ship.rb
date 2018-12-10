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

class Type036Ship < ApplicationRecord
  acts_as_list top_of_list: 0
  default_scope { order(:position) }

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

  belongs_to :reorderable, polymorphic: true # 何かの対象レコード

  concern :UseSideMethods do
    included do
      with_options as: :reorderable, dependent: :destroy, inverse_of: :reorderable do
        has_one :type036_ship, class_name: "Type036Ship"
      end
      accepts_nested_attributes_for :type036_ship, reject_if: :all_blank, allow_destroy: true

      after_save do
        unless type036_ship
          create_type036_ship!
        end
      end
    end

    class_methods do
    end
  end
end
