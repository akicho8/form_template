# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 複数ファイルアップロード1テーブル (type009_articles as Type009Article)
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
  class Type009ArticlesController < ApplicationController
    include PlaggableCrud::All

    # 「新規」→「管理画面 or 更新」のときに assign_attributes に渡す属性
    def current_record_params
      if attrs = super
        attrs.merge(:type009_files_attributes => current_up_files)
      end
    end

    def page_header_show_title
      current_record.title
    end

    private

    # トップレベルで定義した file_field_tag(:up_files) を受け取って current_record_params 用に加工する
    def current_up_files
      Array(params[:up_files]).collect { |e| {:pixer => e} }
    end

    def raw_current_record
      super.tap do |e|
        e.title ||= "アルバム#{current_model.maximum(:id).to_i.next}"
      end
    end
  end
end
