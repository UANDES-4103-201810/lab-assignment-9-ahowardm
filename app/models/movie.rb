class Movie < ApplicationRecord
  belongs_to :director
  belongs_to :address
  has_many :categories
  accepts_nested_attributes_for :address
end
