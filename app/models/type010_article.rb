# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 位置が重要なアルバム情報テーブル (type010_articles as Type010Article)
#
# |------------+----------+----------+-------------+------+-------|
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# |------------+----------+----------+-------------+------+-------|
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | name       | 名前     | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# |------------+----------+----------+-------------+------+-------|

class Type010Article < ApplicationRecord
  # ぶらさがる画像を個別に参照するための仕組み
  concerning :IndividualMethods do
    included do
      cattr_accessor :file_column_keys do
        [
          :type010_file_a,
          :type010_file_b,
          :type010_file_c,
        ]
      end

      with_options(class_name: "Type010File", dependent: :destroy, inverse_of: :type010_article) do
        has_one :type010_file_a, -> { order(created_at: :desc).where(position: 0) }
        has_one :type010_file_b, -> { order(created_at: :desc).where(position: 1) }
        has_one :type010_file_c, -> { order(created_at: :desc).where(position: 2) }
      end

      accepts_nested_attributes_for :type010_file_a
      accepts_nested_attributes_for :type010_file_b
      accepts_nested_attributes_for :type010_file_c
    end

    def file_column_objs
      file_column_keys.inject({}) {|a, e| a.merge(e => send(e)) }
    end

    def filled_file_column_objs
      file_column_keys.each.with_index.inject({}) {|a, (e, i)| a.merge(e => send(e) || send("build_#{e}"))}
    end
  end

  # ぶらさがる画像を has_many で参照するための仕組み
  concerning :SummaryMethods do
    included do
      has_many :type010_files, -> { order(:position) }, inverse_of: :type010_article, dependent: :destroy
      accepts_nested_attributes_for :type010_files

      # type010_files_attributes 経由で設定されるとどんどん溜っていくので古いのは追加のタイミングで削除する
      after_save do
        (type010_files - file_column_keys.collect {|key| send(key) }.compact).each(&:destroy!)
      end
    end

    def up_files=(v)
      assign_attributes(type010_files_attributes: v.collect.with_index { |e, i| {media_file: e, position: i} })
    end
  end

  # 削除
  concerning :DeleteMethods do
    included do
      attr_accessor :delete_ids

      after_save do
        if delete_ids.present?
          type010_files.find(delete_ids).each(&:destroy!)
          self.delete_ids = nil
        end
      end
    end
  end
end
