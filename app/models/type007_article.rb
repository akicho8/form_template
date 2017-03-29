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
  has_many :type007_seven_ships, :dependent => :destroy
  has_many :seven_days, :through => :type007_seven_ships

  with_options(:presence => true) do
    validates :name
  end

  concerning :ConfirmMethods do
    attr_accessor :temp_seven_day_ids # 更新するときはこれに設定して確認画面にいく

    # チェックボックスの状態を確認するにはフォーム入力の情報を優先する、このメソッドを使うこと
    # また presence? のものだけにしているのはmultipleセレクトボックスで空文字列が常に飛んでくるためが常に来てしまうため
    def temp_seven_day_ids
      (@temp_seven_day_ids || seven_day_ids).find_all(&:present?).collect(&:to_i)
    end

    included do
      # 保存し終わったときに @temp_seven_day_ids を反映する
      after_save do
        if @temp_seven_day_ids
          self.seven_day_ids = @temp_seven_day_ids # ここで中間テーブルが整理される
          @temp_seven_day_ids = nil
        end
      end
    end
  end
end
