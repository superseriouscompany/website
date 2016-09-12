class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.string :thinker
      t.text :body

      t.timestamps null: false
    end
  end
end
