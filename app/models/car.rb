# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :user
  has_many :reservations
end
