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

class CreateMyAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :my_albums, force: true do |t|
      t.string :r_ap_string1
      t.integer :position, index: true
      t.timestamps null: false
    end

    create_table :my_album_elements, force: true do |t|
      t.belongs_to :my_album, null: false, index: true
      t.string :media_file
      t.string :r_ape_string1
      t.integer :position, index: true
      t.timestamps null: false
    end

    create_table :word_infos, force: true do |t|
      t.belongs_to :wordable, polymorphic: true, null: false
      t.string :key, null: false, index: true
      t.string :locale_key, index: true, null: false
      t.text :paper_text, null: false
      t.text :speech_text
      t.integer :position, index: true
      t.timestamps null: false

      t.index [:key, :wordable_type, :wordable_id, :locale_key], unique: true, name: :word_infos_kwwl
    end
  end
end
