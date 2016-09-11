class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :portuguese_title
      t.string :english_title
      t.text :neil_quote
      t.text :santi_quote
      t.string :image_url

      t.timestamps null: false
    end
  end
end
