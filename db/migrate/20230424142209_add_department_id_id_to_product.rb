# frozen_string_literal: true

class AddDepartmentIdIdToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :department_id, :integer
  end
end
