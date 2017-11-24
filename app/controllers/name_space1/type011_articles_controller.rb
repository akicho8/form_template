# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 2ch形式スレッドテーブル (type011_articles as Type011Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | title      | タイトル | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

module NameSpace1
  class Type011ArticlesController < ApplicationController
    include ModulableCrud::All

    def page_header_show_title
      current_record.title
    end

    def raw_current_record
      super.tap do |e|
        e.title ||= "スレッド#{current_model.maximum(:id).to_i.next}"
      end
    end

    # 更新後の移動先
    def redirect_to_where
      [:edit, self.class.parent_name.underscore, current_record]
    end
  end
end
