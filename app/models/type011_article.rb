# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 2ch形式スレッドテーブル (type011_articles as Type011Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | title      | タイトル | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

class Type011Article < ApplicationRecord
  # 1つ目の書き込みを、最初のスレッド作成時に登録するため
  concerning :IndividualMethods do
    included do
      with_options(class_name: "Type011Comment", dependent: :destroy, :inverse_of => :type011_article) do
        has_one :type011_comment_first, -> { order(:created_at) }
      end

      accepts_nested_attributes_for :type011_comment_first, reject_if: proc { |attributes| attributes[:comment].blank? }, allow_destroy: true
    end
  end

  # ぶらさがる書き込みを has_many で参照するための仕組み
  concerning :SummaryMethods do
    included do
      has_many :type011_comments, -> { order(:created_at) }, :inverse_of => :type011_article, :dependent => :destroy
      accepts_nested_attributes_for :type011_comments, reject_if: proc { |attributes| attributes[:comment].blank? }, allow_destroy: true
    end
  end
end
