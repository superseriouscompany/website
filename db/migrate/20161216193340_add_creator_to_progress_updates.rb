class AddCreatorToProgressUpdates < ActiveRecord::Migration
  def change
    add_column :progress_updates, :creator, :string
  end
end
