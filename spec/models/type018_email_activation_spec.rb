# -*- coding: utf-8 -*-
# == Schema Information ==
#
# メール認証テーブル (type018_email_activations as Type018EmailActivation)
#
# +----------------+----------------+----------+-------------+------+-------+
# | カラム名       | 意味           | タイプ   | 属性        | 参照 | INDEX |
# +----------------+----------------+----------+-------------+------+-------+
# | id             | ID             | integer  | NOT NULL PK |      |       |
# | email          | メールアドレス | string   | NOT NULL    |      |       |
# | activate_token | トークン       | string   | NOT NULL    |      | A!    |
# | expired_at     | 期限           | datetime | NOT NULL    |      |       |
# | activated_at   | 本登録日時     | datetime |             |      |       |
# | created_at     | 作成日時       | datetime | NOT NULL    |      |       |
# | updated_at     | 更新日時       | datetime | NOT NULL    |      |       |
# +----------------+----------------+----------+-------------+------+-------+

require 'rails_helper'

RSpec.describe Type018EmailActivation, type: :model do
end
