# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 複数ファイルアップロード1テーブル (type037_articles as Type037Article)
#
# |------------+----------+----------+-------------+------+-------|
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# |------------+----------+----------+-------------+------+-------|
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | title      | タイトル | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# |------------+----------+----------+-------------+------+-------|

module NameSpace1
  class Type037ArticlesController < ApplicationController
    include ModulableCrud::All

    def page_header_show_title
      current_record.title
    end

    def raw_current_record
      super.tap do |e|
        e.title ||= "アルバム#{current_model.maximum(:id).to_i.next}"
      end
    end

    def create
      if request.format.json?
        remove_create_or_update
        return
      end

      super
    end

    def update
      if request.format.json?
        remove_create_or_update
        return
      end

      super
    end

    private

    def remove_create_or_update
      if upfile_infos = params[:upfile_infos]
        type037_attachment_files = upfile_infos.collect do |upfile_info|
          data_base64_body = upfile_info[:data_base64_body]
          md = data_base64_body.match(/\A(data):(?<content_type>.*?);base64,(?<base64_body>.*)/)
          md or raise "Data URL scheme 形式になっていません : #{data_base64_body.inspect}"
          body = Base64.decode64(md["base64_body"])
          tempfile = Tempfile.open
          tempfile.binmode
          tempfile.write(body)
          ActionDispatch::Http::UploadedFile.new(filename: upfile_info[:filename], type: upfile_info[:content_type], tempfile: tempfile)
        end

        retv = current_record.update(type037_attachment_files: type037_attachment_files)
        unless retv
          render json: { errors_full_messages: current_record.errors.full_messages }
          return
        end

        render json: { stored_file_infos: current_record.type037_attachments.as_json(methods: :media_info) }
        return
      end
    end
  end
end
