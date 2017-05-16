# -*- coding: utf-8 -*-
# == Schema Information ==
#
# チェックボックスで複数項目設定2テーブル (type007_articles as Type007Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | name       | 名前     | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

class Type007Article < ApplicationRecord
  has_many :type007_team_ships, dependent: :destroy
  has_many :teams, through: :type007_team_ships

  with_options(presence: true) do
    validates :name
  end

  concerning :ConfirmMethods do
    attr_accessor :temp_team_ids # 更新するときはこれに設定して確認画面にいく

    # チェックボックスの状態を確認するにはフォーム入力の情報を優先する、このメソッドを使うこと
    # また presence? のものだけにしているのはmultipleセレクトボックスで空文字列が常に飛んでくるためが常に来てしまうため
    def temp_team_ids
      (@temp_team_ids || team_ids).find_all(&:present?).collect(&:to_i)
    end

    included do
      # 保存し終わったときに @temp_team_ids を反映する
      after_save do
        if @temp_team_ids
          self.team_ids = @temp_team_ids # ここで中間テーブルが整理される
          @temp_team_ids = nil
        end
      end
    end
  end
end
