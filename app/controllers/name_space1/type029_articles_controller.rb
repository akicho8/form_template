# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 件名と本文のみテーブル (type029_articles as Type029Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | subject    | 件名     | string   |             |      |       |
# | body       | 内容     | text     |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

module NameSpace1
  class Type029ArticlesController < ApplicationController
    include PluggableCrud::All

    # remote: true で来たときビューに show.js.coffee があれば自動的に実行される
    def show
      current_record.update!(show_counter: current_record.show_counter.to_i + 1)
    end

    # ajax_action_sample.js.coffee があるので自動的に反応
    # def ajax_action_sample
    # end
  end
end
