# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 位置が重要なアルバム情報テーブル (type010_articles as Type010Article)
#
# |------------+----------+----------+-------------+------+-------|
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# |------------+----------+----------+-------------+------+-------|
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | name       | 名前     | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# |------------+----------+----------+-------------+------+-------|

module NameSpace1
  class Type010ArticlesController < ApplicationController
    include ModulableCrud::All

    def page_header_show_title
      current_record.name
    end

    def raw_current_record
      super.tap do |e|
        e.name ||= "画像パターン#{current_model.maximum(:id).to_i.next}"
      end
    end

    # 更新後の移動先
    def redirect_to_where
      [:edit, self.class.parent_name.underscore, current_record]
    end
  end
end
