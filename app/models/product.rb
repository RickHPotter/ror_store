# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :department, optional: true
  validates :name, length: { minimum: 2 }
  validates :price, presence: true
end
