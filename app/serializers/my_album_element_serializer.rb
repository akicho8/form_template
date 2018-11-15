class MyAlbumElementSerializer < ApplicationSerializer
  attribute :id
  attribute :media_file_url

  has_many :word_infos
end
