# -*- coding: utf-8 -*-
# == Schema Information ==
#
# コンテンツ要素テーブル (my_album_elements as MyAlbumElement)
#
# |---------------+----------------+----------+-------------+---------------+-------|
# | カラム名      | 意味           | タイプ   | 属性        | 参照          | INDEX |
# |---------------+----------------+----------+-------------+---------------+-------|
# | id            | ID             | integer  | NOT NULL PK |               |       |
# | my_album_id   | コンテンツ(親) | integer  | NOT NULL    | => MyAlbum#id | B     |
# | media_file    | 画像           | string   |             |               |       |
# | r_ape_string1 | 名前           | string   |             |               |       |
# | position      | 順序           | integer  |             |               | A     |
# | created_at    | 作成日時       | datetime | NOT NULL    |               |       |
# | updated_at    | 更新日時       | datetime | NOT NULL    |               |       |
# |---------------+----------------+----------+-------------+---------------+-------|
#
#- 備考 -------------------------------------------------------------------------
# ・MyAlbumElement モデルは MyAlbum モデルから has_one :my_album_element_first されています。
#--------------------------------------------------------------------------------

class MyAlbumElement < ApplicationRecord
  include ActiveSupport::Configurable
  belongs_to :my_album, inverse_of: :my_album_elements
  acts_as_list scope: :my_album, top_of_list: 0

  mount_uploader :media_file, AttachmentUploader

  # before_validation do
  #   if media_file.url.blank?
  #     mark_for_destruction
  #   end
  # end

  # def media_file_url
  #   if media_file.url
  #     Rails.application.routes.url_helpers.root_url.remove(%r{/\z}) + media_file.url
  #   end
  # end

  has_many :word_infos, as: :wordable, class_name: "WordInfo", dependent: :destroy, inverse_of: :wordable
  accepts_nested_attributes_for :word_infos, reject_if: proc {|attributes| attributes[:locale_key].blank? || attributes[:paper_text].blank? }, allow_destroy: true
end
