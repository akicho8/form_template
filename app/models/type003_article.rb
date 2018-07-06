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

class Type003Article < ApplicationRecord
  normalize_default_options.update(strip_tags: true, space_zentohan: true, hankaku: true, squish: true, blank_to_nil: true)

  normalize :first_name
  normalize :last_name
  normalize :first_name_hiragana, hiragana: true
  normalize :last_name_hiragana, hiragana: true
  normalize :first_postal_code
  normalize :last_postal_code
  normalize :prefecture_name
  normalize :city_address
  normalize :number_address
  normalize :house_name
  normalize :legal_accept_key
  normalize :first_tel
  normalize :middle_tel
  normalize :last_tel
  normalize :email
  # normalize :body

  # before_validation on: :create do
  #   if Rails.env.development? || Rails.env.test?
  #     self.first_name ||= "山田"
  #     self.last_name ||= "太郎"
  #     self.first_name_hiragana ||= "やまダ"
  #     self.last_name_hiragana ||= "たろー"
  #
  #     self.first_postal_code ||= "154"
  #     self.last_postal_code ||= "0023"
  #     self.prefecture_name ||= "東京都"
  #     self.city_address ||= "世田谷区"
  #     self.number_address ||= "12-34-56"
  #     self.house_name ||= "トキワ荘"
  #
  #     self.email ||= "alice@localhost"
  #     self.confirm_email ||= "alice@localhost"
  #
  #     self.first_tel ||= "090"
  #     self.middle_tel ||= "1234"
  #     self.last_tel ||= "5678"
  #   end
  #
  #   true
  # end

  with_options(presence: true) do
    validates :first_name
    validates :last_name
    validates :first_name_hiragana
    validates :last_name_hiragana

    validates :first_postal_code
    validates :last_postal_code
    validates :prefecture_name
    validates :city_address
    validates :number_address

    validates :email
    validates :confirm_email

    # validates :legal_accept_key, acceptance: {accept: "true"}
    validates :first_tel
    validates :middle_tel
    validates :last_tel
  end

  with_options(allow_blank: true) do
    # validates :first_name_hiragana, :last_name_hiragana, format: {with: /\A\p{hiragana}+\z/}
    validates :first_name_hiragana, :last_name_hiragana, format: {without: /[一-龠]/} # 漢字が含まれていたらだめ
    validates :first_postal_code, :last_postal_code,     format: {with: /\A\d+\z/}
    validates :email, uniqueness: true,               format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
    validates :first_tel, :middle_tel, :last_tel,        format: {with: /\A\d+\z/}
  end

  validates :legal_accept_key, acceptance: {accept: "true", message: "を受諾してください"}

  attr_accessor :confirm_email

  validate on: :create do
    if errors[:email].blank? && errors[:confirm_email].blank?
      if email && confirm_email
        if email != confirm_email
          # errors.add(:base, "#{self.class.human_attribute_name(:email)}と#{self.class.human_attribute_name(:confirm_email)}のどちらかが間違っています")
          errors.add(:confirm_email, "が#{self.class.human_attribute_name(:confirm_email)}と合っていません")
        end
      end
    end
  end

  # with_options(presence: true) do
  #   validates :first_name
  #   validates :last_name
  #   validates :first_name_hiragana
  #   validates :last_name_hiragana
  #   validates :first_postal_code, :last_postal_code, format: {with: /\A\d+\Z/}
  #   validates :first_tel, :middle_tel, :last_tel, format: {with: /\A\d+\Z/}
  #   validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  #   validates :prefecture_name
  #   validates :city_address
  #   validates :number_address
  #   validates :legal_accept_key, acceptance: {accept: "true"}
  # end

  # with_options(presence: true) do
  #   validates :email
  # end
  #
  # with_options(allow_blank: true) do
  #   validates :email, uniqueness: true
  # end

  def full_name
    [first_name, last_name].join
  end

  def full_name_hiragana
    [first_name_hiragana, last_name_hiragana].join
  end

  def postal_code
    [first_postal_code, last_postal_code].join("-")
  end

  def full_address
    [
      prefecture_name,
      city_address,
      number_address,
      house_name,
    ].compact.collect { |e| e.remove(" ") }.join(" ")
  end

  def tel
    [first_tel, middle_tel, last_tel].join("-")
  end

  def term_accept_info
    LegalAcceptInfo.fetch_if(legal_accept_key)
  end
end
