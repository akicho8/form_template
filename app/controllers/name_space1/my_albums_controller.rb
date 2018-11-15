# -*- coding: utf-8 -*-
# == Schema Information ==
#
# コンテンツテーブル (my_albums as MyAlbum)
#
# |--------------+----------+----------+-------------+------+-------|
# | カラム名     | 意味     | タイプ   | 属性        | 参照 | INDEX |
# |--------------+----------+----------+-------------+------+-------|
# | id           | ID       | integer  | NOT NULL PK |      |       |
# | r_ap_string1 | タイトル | string   |             |      |       |
# | position     | 順序     | integer  |             |      | A     |
# | created_at   | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at   | 更新日時 | datetime | NOT NULL    |      |       |
# |--------------+----------+----------+-------------+------+-------|

module NameSpace1
  class MyAlbumsController < ApplicationController
    include ModulableCrud::All

    # include Shared

    # let :current_scope do
    #   current_guide.my_albums
    # end

    # let :current_record do
    #   if params[:id]
    #     record = current_scope.find(params[:id])
    #   else
    #     record = current_scope.new
    #   end
    #   record.tap do |e|
    #     if Rails.env.development?
    #       e.r_ap_string1 ||= "#{current_model.model_name.human}#{current_model.maximum(:id).to_i.next}"
    #     end
    #   end
    # end
  end
end
