class AddCompletedAtToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :completed_at, :datetime
    add_index :projects, :completed_at
  end
end
