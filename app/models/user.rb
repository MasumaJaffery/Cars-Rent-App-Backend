# frozen_string_literal: true
class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
  has_many :reservations
  has_many :cars
end
