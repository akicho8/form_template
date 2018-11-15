# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 文言情報テーブル (word_infos as WordInfo)
#
# |---------------+--------------------+----------+-------------+-----------------------+-------|
# | カラム名      | 意味               | タイプ   | 属性        | 参照                  | INDEX |
# |---------------+--------------------+----------+-------------+-----------------------+-------|
# | id            | ID                 | integer  | NOT NULL PK |                       |       |
# | wordable_type | 対応レコードタイプ | string   | NOT NULL    | モデル名(polymorphic) | A! E  |
# | wordable_id   | 対応レコードID     | integer  | NOT NULL    | => (wordable_type)#id | A! E  |
# | key           | Key                | string   | NOT NULL    |                       | A! D  |
# | locale_key    | 言語               | string   | NOT NULL    |                       | A! C  |
# | paper_text    | テキスト           | text     | NOT NULL    |                       |       |
# | speech_text   | 読み上げ           | text     |             |                       |       |
# | position      | 順序               | integer  |             |                       | B     |
# | created_at    | 作成日時           | datetime | NOT NULL    |                       |       |
# | updated_at    | 更新日時           | datetime | NOT NULL    |                       |       |
# |---------------+--------------------+----------+-------------+-----------------------+-------|

require 'rails_helper'

RSpec.describe WordInfo, type: :model do
  it do
    WordInfo.count
  end
end
