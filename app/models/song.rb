class Song < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :artist, presence: true
  validates :genre, presence: true
end