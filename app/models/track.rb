class Track < ActiveRecord::Base
  belongs_to :album,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: :Album

  has_many :notes,
  primary_key: :id,
  foreign_key: :track_id,
  class_name: :Note

end
