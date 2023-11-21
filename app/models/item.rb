# frozen_string_literal: true

class Item < ApplicationRecord
    has_many :cars
    has_many :reservations
  end