class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, :body, presence: true
  validates_length_of :body, minmum: 5, maximum: 140
end
