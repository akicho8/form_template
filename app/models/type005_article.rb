# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 複数ファイルアップロード(確認付き)テーブル (type005_articles as Type005Article)
#
# |------------+----------+----------+-------------+------+-------|
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# |------------+----------+----------+-------------+------+-------|
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | title      | タイトル | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# |------------+----------+----------+-------------+------+-------|

class Type005Article < ApplicationRecord
  has_many :type005_files, -> { order(:position) }, inverse_of: :type005_article, dependent: :destroy
  accepts_nested_attributes_for :type005_files, allow_destroy: true, reject_if: proc { |attributes|
    v = false
    v ||= attributes[:media_file].present?
    v ||= attributes[:id].present?
    v.!
  }

  with_options presence: true do
    validates :title
  end

  # 一括アップロード用
  def up_files=(v)
    assign_attributes(type005_files_attributes: v.collect { |e| {media_file: e} })
  end

  # 全削除用
  concerning :AllRemoveMethods do
    attr_accessor :type005_files_all_remove

    def type005_files_all_remove?
      type005_files_all_remove.to_s == "1"
    end

    included do
      after_save do
        if type005_files_all_remove?
          type005_files.destroy_all
        end
      end
    end
  end

  # 確認用
  concerning :ConfirmMethods do
    # 中間ファイルの情報を持っているもののみ
    def temp_type005_files
      type005_files.find_all(&:media_file_cache)
    end

    # 保存済みのファイルのみ
    def persisted_type005_files
      type005_files - temp_type005_files
    end
  end
end
