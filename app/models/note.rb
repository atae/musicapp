class Note < ActiveRecord::Base
  validates :note, :author_id, :track_id, presence: true

  belongs_to :author,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :User

  belongs_to :track,
  primary_key: :id,
  foreign_key: :track_id,
  class_name: :Track


end
