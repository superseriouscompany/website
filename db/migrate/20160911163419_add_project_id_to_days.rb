class AddProjectIdToDays < ActiveRecord::Migration
  def change
    add_column :days, :project_id, :integer
  end
end
