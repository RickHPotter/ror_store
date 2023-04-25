# frozen_string_literal: true

# `@name[min: 2]`
# `@description`
# `@department[belongs_to_optional, presence: true]`
# `@price[presence: true]`
# `@stock`
class Product < ApplicationRecord
  belongs_to :department, optional: true
  validates :name, length: { minimum: 2 }
  validates :price, :department, presence: true
end
