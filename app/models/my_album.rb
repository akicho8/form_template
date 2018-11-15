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

require "set"

class MyAlbum < ApplicationRecord
  acts_as_list top_of_list: 0

  # 1つ目の書き込みを、最初のスレッド作成時に登録するため
  concerning :IndividualMethods do
    included do
      with_options(class_name: "MyAlbumElement", dependent: :destroy, inverse_of: :my_album) do
        has_one :my_album_element_first, -> { order(:created_at) }
      end

      # accepts_nested_attributes_for :my_album_element_first, reject_if: proc { |attributes| [:r_ape_string1, :r_ape_url1].any? { |e| attributes[e].blank? } }, allow_destroy: true
      accepts_nested_attributes_for :my_album_element_first, reject_if: proc { |attributes| [:r_ape_string1].any? { |e| attributes[e].blank? } }, allow_destroy: true
    end
  end

  # ぶらさがる書き込みを has_many で参照するための仕組み
  concerning :SummaryMethods do
    included do
      has_many :my_album_elements, -> { order(:position) }, inverse_of: :my_album, dependent: :destroy
      # accepts_nested_attributes_for :my_album_elements, reject_if: proc { |attributes| [:r_ape_string1, :r_ape_url1].any? { |e| attributes[e].blank? } }, allow_destroy: true
      # accepts_nested_attributes_for :my_album_elements_fi # , reject_if: proc { |attributes| [:r_ape_string1, :r_ape_url1].any? { |e| attributes[e].blank? } }, allow_destroy: true
      # accepts_nested_attributes_for :my_album_elements, reject_if: proc { |attributes| raise attributes.inspect }, allow_destroy: true
      accepts_nested_attributes_for :my_album_elements, reject_if: :my_album_element_blank, allow_destroy: true
      # accepts_nested_attributes_for :my_album_elements, allow_destroy: true

      def my_album_element_blank(attributes)
        !my_album_element_enable(attributes)
      end

      def my_album_element_enable(attributes)
        flag = false
        flag ||= attributes[:media_file].present?
        flag ||= attributes[:id].present?

        if v = attributes[:word_infos_attributes]
          flag ||= v["0"] && v["0"][:paper_text].present?
        end

        flag
      end

      # 内容を空にしたらレコードを削除したいとき
      # accepts_nested_attributes_for :my_album_elements, allow_destroy: true
      # before_validation do
      #   my_album_elements.each do |my_album_element|
      #     if my_album_element.r_ape_string1.blank?
      #       my_album_element.mark_for_destruction
      #     end
      #   end
      # end
    end
  end

  # has_many :my_album_elements, inverse_of: :my_album, dependent: :destroy
  # accepts_nested_attributes_for :my_album_elements

  # with_options(presence: true) do
  #   validates :title
  # end

  def up_files=(v)
    assign_attributes(my_album_elements_attributes: v.collect { |e| {media_file: e} })
  end

  concerning :AllRemoveMethods do
    attr_accessor :my_album_elements_all_remove

    def my_album_elements_all_remove?
      my_album_elements_all_remove.to_s == "1"
    end

    included do
      after_save do
        if my_album_elements_all_remove?
          my_album_elements.destroy_all
        end
      end
    end
  end

  concerning :ConfirmMethods do
    # 中間ファイルの情報を持っているもののみ
    def temp_my_album_elements
      my_album_elements.find_all(&:media_file_cache)
    end

    # 保存済みのファイルのみ
    def persisted_my_album_elements
      my_album_elements - temp_my_album_elements
    end
  end
end
