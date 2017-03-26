# -*- coding: utf-8 -*-
# == Schema Information ==
#
# ファイルアップロードテーブル (type004_articles as Type004Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | pixer      | ファイル | string   |             |      |       |
# | comment    | コメント | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

module NameSpace1
  class Type004ArticlesController < ApplicationController
    include PlaggableCrud::AllWithConfirm

    def current_permit_columns
      super + [:pixer_cache, :remove_pixer]
    end

    # 確認画面に行く直前にセッションに保存しておく値たち
    def current_session_attributes
      attrs = current_record_params.except(:pixer) # pixerはオブジェクトは巨大なので退ける

      # すでにアップロード済みの状態ならそのキーをセッションに保存
      if v = current_record.pixer_cache
        attrs[:pixer_cache] = v
      end

      attrs
    end
  end
end

