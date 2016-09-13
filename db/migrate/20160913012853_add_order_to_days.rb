class AddOrderToDays < ActiveRecord::Migration
  def change
    add_column :days, :order, :string
  end
end
