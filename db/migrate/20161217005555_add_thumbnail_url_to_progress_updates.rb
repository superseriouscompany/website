class AddThumbnailUrlToProgressUpdates < ActiveRecord::Migration
  def change
    add_column :progress_updates, :thumbnail_url, :string
  end
end
