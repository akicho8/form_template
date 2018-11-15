class MyAlbumSerializer < ApplicationSerializer
  attribute :id
  attribute :r_ap_string1

  has_many :my_album_elements
end
