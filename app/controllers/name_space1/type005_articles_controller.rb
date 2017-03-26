# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 確認付き複数ファイルアップロードテーブル (type005_articles as Type005Article)
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
  class Type005ArticlesController < ApplicationController
    include PlaggableCrud::AllWithConfirm

    # 「確認画面」から「更新」のとき復帰するためセッションに保存しておく情報
    def current_session_attributes
      super.merge(:type005_files_attributes => current_record.temp_type005_files.collect {|e| {:pixer_cache => e.pixer_cache} })
    end

    # 「新規」→「管理画面 or 更新」のときに assign_attributes に渡す属性
    def current_record_params
      if attrs = super
        attrs.merge(:type005_files_attributes => [current_up_caches, current_up_files].flatten.compact)
      end
    end

    def current_record_save
      # 仮画像の個別削除
      current_record.temp_type005_files.find_all { |e|
        current_reject_codes.include?(e.pixer_cache)
      }.each(&:destroy!)

      if super
        # 既存画像の個別削除
        current_record.type005_files.find_all { |e| current_delete_ids.include?(e.id) }.each(&:destroy!)
        true
      end
    end

    # 削除したい既存画像レコードのIds
    def current_delete_ids
      params[:delete_ids].to_s.scan(/\d+/).collect(&:to_i)
    end

    # いまUPした中間画像を削除したいキーのリスト
    def current_reject_codes
      Array.wrap(params[:reject_codes])
    end

    def page_header_show_title
      current_record.title
    end

    private

    def current_up_caches
      Array(params[:up_caches]).collect { |e| {:pixer_cache => e} }
    end

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
