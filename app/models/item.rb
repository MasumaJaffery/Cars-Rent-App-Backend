# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :reservations
end