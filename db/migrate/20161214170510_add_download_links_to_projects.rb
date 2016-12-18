class AddDownloadLinksToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :app_store_url, :string
    add_column :projects, :play_store_url, :string
    add_column :projects, :mac_app_store_url, :string
  end
end
