# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 件名と本文の画像認証対応版テーブル (type015_articles as Type015Article)
#
# +------------+-----------+----------+-------------+------+-------+
# | カラム名   | 意味      | タイプ   | 属性        | 参照 | INDEX |
# +------------+-----------+----------+-------------+------+-------+
# | id         | ID        | integer  | NOT NULL PK |      |       |
# | subject    | 件名      | string   |             |      |       |
# | body       | 内容      | text     |             |      |       |
# | remote_ip  | Remote ip | string   |             |      |       |
# | created_at | 作成日時  | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時  | datetime | NOT NULL    |      |       |
# +------------+-----------+----------+-------------+------+-------+

module NameSpace1
  class Type015ArticlesController < ApplicationController
    include PlaggableCrud::AllWithConfirm
    include SimpleCaptcha::ControllerHelpers

    def captcha_status
      Rails.cache.read(current_captcha_session_key)
    end

    def new
      self.captcha_status = false # 「新規」から開始すると再び画像認証を有効にする
      super
    end
    
    private

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
        v &&= captcha_once_valid?
      end
      v
    end

    def current_session_attributes
      super.except("captcha", "captcha_key")
    end

    def captcha_once_valid?
      self.captcha_status ||= current_record.is_captcha_valid?
    end

    def captcha_status=(v)
      v.tap { Rails.cache.write(current_captcha_session_key, v, :expires_in => Rails.env.production? ? 10.minutes : 30.seconds) }
    end
    
    def current_captcha_session_key
      [current_single_key, :captcha_key, session.id].join("_")
    end
  end
end
