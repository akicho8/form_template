# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 件名と本文の画像認証対応版テーブル (type002_articles as Type002Article)
#
# +------------+--------------+----------+-------------+------+-------+
# | カラム名   | 意味         | タイプ   | 属性        | 参照 | INDEX |
# +------------+--------------+----------+-------------+------+-------+
# | id         | ID           | integer  | NOT NULL PK |      |       |
# | subject    | 件名         | string   |             |      |       |
# | body       | 内容         | text     |             |      |       |
# | remote_ip  | アクセス元IP | string   |             |      |       |
# | created_at | 作成日時     | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時     | datetime | NOT NULL    |      |       |
# +------------+--------------+----------+-------------+------+-------+

module NameSpace1
  class Type002ArticlesController < ApplicationController
    include PluggableCrud::AllWithConfirm

    include SimpleCaptcha::ControllerHelpers

    def raw_current_record
      super.tap do |e|
        e.remote_ip = request.remote_ip
      end
    end

    def current_record_save
      if current_record_valid?
        super
      end
    end

    def current_record_valid?
      v = current_record.valid?
      if current_record_params.has_key?(:captcha_key)
        # unless session[current_single_key]
        v &&= current_record.is_captcha_valid?
        # end
      end
      v
    end

    # 確認画面を描画する直前に呼ぶ処理
    def current_session_attributes
      super.except("captcha", "captcha_key")
    end
  end
end
