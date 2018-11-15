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

module NameSpace1
  module MyAlbums
    class MyAlbumElementsController < ApplicationController
      include ModulableCrud::All
      include Shared

      let :current_my_album do
        MyAlbum.find(params[:my_album_id])
      end

      let :current_scope do
        current_my_album.my_album_elements
      end

      let :current_record do
        if params[:id]
          record = current_scope.find(params[:id])
        else
          record = current_scope.new
        end
        record.tap do |e|
        end
      end

      def current_record_save
        super.tap do
          if v = params[:move_to]
            current_record.send("move_#{v}")
          end
        end
      end

      def redirect_to_where
        [:edit, *ns_prefix, current_my_album]
      end
    end
  end
end
