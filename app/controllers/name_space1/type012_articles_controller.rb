# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 孫まで一気に更新テーブル (type012_articles as Type012Article)
#
# |------------+----------+----------+-------------+------+-------|
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# |------------+----------+----------+-------------+------+-------|
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | comment0   | タイトル | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# |------------+----------+----------+-------------+------+-------|

module NameSpace1
  class Type012ArticlesController < ApplicationController
    include ModulableCrud::All

    def raw_current_record
      super.tap do |e|
        e.comment0 ||= "#{current_model.model_name.human}#{current_model.maximum(:id).to_i.next}"
      end
    end

    # 更新後の移動先
    def redirect_to_where
      [:edit, self.class.parent_name.underscore, current_record]
    end
  end
end
