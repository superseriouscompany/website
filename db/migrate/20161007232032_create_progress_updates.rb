class CreateProgressUpdates < ActiveRecord::Migration
  def change
    create_table :progress_updates do |t|
      t.text :description
      t.string :image_url
      t.string :project_id

      t.timestamps null: false
    end
  end
end
