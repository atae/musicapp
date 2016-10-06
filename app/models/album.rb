class Album < ActiveRecord::Base
  validates :band_id, :live?, :title, presence: true

  belongs_to :band,
  primary_key: :id,
  foreign_key: :band_id,
  class_name: :Band

  has_many :tracks,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: :Track,
  dependent: :destroy
end
