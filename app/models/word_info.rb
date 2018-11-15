# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 文言情報テーブル (word_infos as WordInfo)
#
# |---------------+--------------------+----------+-------------+-----------------------+-------|
# | カラム名      | 意味               | タイプ   | 属性        | 参照                  | INDEX |
# |---------------+--------------------+----------+-------------+-----------------------+-------|
# | id            | ID                 | integer  | NOT NULL PK |                       |       |
# | wordable_type | 対応レコードタイプ | string   | NOT NULL    | モデル名(polymorphic) | A! E  |
# | wordable_id   | 対応レコードID     | integer  | NOT NULL    | => (wordable_type)#id | A! E  |
# | key           | Key                | string   | NOT NULL    |                       | A! D  |
# | locale_key    | 言語               | string   | NOT NULL    |                       | A! C  |
# | paper_text    | テキスト           | text     | NOT NULL    |                       |       |
# | speech_text   | 読み上げ           | text     |             |                       |       |
# | position      | 順序               | integer  |             |                       | B     |
# | created_at    | 作成日時           | datetime | NOT NULL    |                       |       |
# | updated_at    | 更新日時           | datetime | NOT NULL    |                       |       |
# |---------------+--------------------+----------+-------------+-----------------------+-------|

class WordInfo < ApplicationRecord
  belongs_to :wordable, polymorphic: true

  has_many :word_infos, as: :wordable, class_name: name, dependent: :destroy, inverse_of: :wordable # 自分自身に対して
  accepts_nested_attributes_for :word_infos, reject_if: :all_blank, allow_destroy: true

  before_validation do
    if Rails.env.test?
      if wordable
        self.key ||= "word#{wordable.word_infos.count}"
      end
    end

    # self.key = SecureRandom.hex

    # if paper_text.blank?
    #   mark_for_destruction
    # end
  end

  with_options presence: true do
    validates :key
    validates :locale_key

    # validates :wordable_type
    # validates :wordable_id

    validates :paper_text
  end

  with_options allow_blank: true do
    validates :locale_key, uniqueness: {scope: [:key, :wordable_type, :wordable_id]}
    validates :locale_key, inclusion: LocaleInfo.keys.collect(&:to_s)
  end

  def locale_info
    LocaleInfo.fetch_if(locale_key)
  end

  def unique_form_id
    h = ApplicationController.helpers
    [h.dom_id(wordable), h.dom_id(self)].join("_")

    # これでもいい
    # @unique_form_id ||= SecureRandom.hex
  end

  # 設定ずみの言語たち
  def used_locale_infos(key)
    wordable.word_infos.where(key: key).pluck(:locale_key).collect { |e| LocaleInfo[e] }
  end

  # まだ設定されていない言語たち
  def non_used_locale_infos(key)
    LocaleInfo.to_a - used_locale_infos(key)
  end
end
