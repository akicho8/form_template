# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 同じモデルに対してチェックボックスとラジオボタンテーブル (type016_articles as Type016Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | name       | 名前     | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

module NameSpace1
  class Type016ArticlesController < ApplicationController
    include PlaggableCrud::All

    # 更新後の移動先
    def redirect_to_where
      [:edit, self.class.parent_name.underscore, current_record]
    end

    def raw_current_record
      # raise params.inspect
      super.tap do |e|
        e.name ||= "#{current_model.count.next}つ目"
      end
    end
  end
end
