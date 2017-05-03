# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 何にでもコメントできるモデルテーブル (type013_articles as Type013Article)
#
# +------------------+------------------+----------+-------------+--------------------------+-------+
# | カラム名         | 意味             | タイプ   | 属性        | 参照                     | INDEX |
# +------------------+------------------+----------+-------------+--------------------------+-------+
# | id               | ID               | integer  | NOT NULL PK |                          |       |
# | commentable_type | Commentable type | string   |             | モデル名(polymorphic)    | A     |
# | commentable_id   | Commentable      | integer  |             | => (commentable_type)#id | A     |
# | comment          | コメント         | string   | NOT NULL    |                          |       |
# | created_at       | 作成日時         | datetime | NOT NULL    |                          |       |
# | updated_at       | 更新日時         | datetime | NOT NULL    |                          |       |
# +------------------+------------------+----------+-------------+--------------------------+-------+

module NameSpace1
  class Type013ArticlesController < ApplicationController
    include PluggableCrud::All

    # 更新後の移動先
    def redirect_to_where
      [:edit, self.class.parent_name.underscore, current_record]
    end
  end
end
