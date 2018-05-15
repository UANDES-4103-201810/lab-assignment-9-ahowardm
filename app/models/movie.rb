class Movie < ApplicationRecord
  has_one :director
  belongs_to :address
  has_many :categories
end
