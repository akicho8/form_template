# -*- coding: utf-8 -*-
# == Schema Information ==
#
# もりだくさん個人情報登録テーブル (type003_articles as Type003Article)
#
# |---------------------+----------------------+----------+-------------+------+-------|
# | カラム名            | 意味                 | タイプ   | 属性        | 参照 | INDEX |
# |---------------------+----------------------+----------+-------------+------+-------|
# | id                  | ID                   | integer  | NOT NULL PK |      |       |
# | first_name          | 姓                   | string   | NOT NULL    |      |       |
# | last_name           | 名                   | string   | NOT NULL    |      |       |
# | first_name_hiragana | 姓(ふりがな)         | string   | NOT NULL    |      |       |
# | last_name_hiragana  | 名(ふりがな)         | string   | NOT NULL    |      |       |
# | first_postal_code   | 郵便番号(左)         | string   | NOT NULL    |      |       |
# | last_postal_code    | 郵便番号(右)         | string   | NOT NULL    |      |       |
# | prefecture_name     | 都道府県             | string   | NOT NULL    |      |       |
# | city_address        | 市区町村             | string   | NOT NULL    |      |       |
# | number_address      | 番地                 | string   | NOT NULL    |      |       |
# | house_name          | ビル名・部屋番号     | string   |             |      |       |
# | email               | 連絡先メールアドレス | string   | NOT NULL    |      | A!    |
# | first_tel           | 市外局番             | string   | NOT NULL    |      |       |
# | middle_tel          | 市内局番             | string   | NOT NULL    |      |       |
# | last_tel            | 加入者番号           | string   | NOT NULL    |      |       |
# | legal_accept_key    | プライバシーポリシー | string   | NOT NULL    |      |       |
# | subject             | 件名                 | string   |             |      |       |
# | body                | 内容                 | text     |             |      |       |
# | remote_ip           | Remote ip            | string   |             |      |       |
# | remote_host         | Remote host          | string   |             |      |       |
# | user_agent          | User agent           | string   |             |      |       |
# | created_at          | 登録日時             | datetime | NOT NULL    |      |       |
# | updated_at          | 更新日時             | datetime | NOT NULL    |      |       |
# |---------------------+----------------------+----------+-------------+------+-------|

module NameSpace1
  class Type003ArticlesController < ApplicationController
    include ModulableCrud::AllWithConfirm

    def index
      respond_to do |format|
        format.all do
          self.current_records = current_scope.order(:id).reverse_order.page(params[:page])
        end
      end
    end

    def raw_current_record
      super.tap do |e|

        if Rails.env.production? || Rails.env.development? || Rails.env.test?
          e.first_name ||= "松岡"
          e.last_name ||= "シューぞー"
          e.first_name_hiragana ||= "マツおか"
          e.last_name_hiragana ||= "シューぞー"

          e.first_postal_code ||= "154"
          e.last_postal_code ||= "0023"
          e.prefecture_name ||= "東京都"
          e.city_address ||= "世田谷区"
          e.number_address ||= "１２−３４−５６"
          e.house_name ||= "一福荘102"

          e.email ||= "alice#{current_model.count.next}@localhost.local"
          e.confirm_email ||= e.email

          e.first_tel ||= "090"
          e.middle_tel ||= "1234"
          e.last_tel ||= "5678"

          e.legal_accept_key ||= "true"
        end

        e.remote_ip = request.remote_ip
        e.remote_host = request.remote_host
        e.user_agent = request.user_agent

        e.legal_accept_key ||= "false"
      end
    end

    def current_permit_columns
      super + [:confirm_email]
    end
  end
end
