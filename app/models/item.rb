class Item < ApplicationRecord
  has_many :cars
  has_many :reservations
end
