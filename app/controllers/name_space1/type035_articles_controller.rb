# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 件名と本文のみテーブル (type035_articles as Type035Article)
#
# |----------+------+---------+-------------+------+-------|
# | カラム名 | 意味 | タイプ  | 属性        | 参照 | INDEX |
# |----------+------+---------+-------------+------+-------|
# | id       | ID   | integer | NOT NULL PK |      |       |
# | position | 順序 | integer |             |      |       |
# |----------+------+---------+-------------+------+-------|

module NameSpace1
  class Type035ArticlesController < ApplicationController
    include ModulableCrud::All

    def raw_current_records
      current_scope
    end

    def current_record_save
      super.tap do
        # コントローラー側で行う場合
        if params[:move_to]
          current_record.send(params[:move_to])
        end
      end
    end

    def redirect_to_where
      [*ns_prefix, current_model]
    end
  end
end
