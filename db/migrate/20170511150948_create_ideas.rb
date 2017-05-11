class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :idea

      t.timestamps null: false
    end
  end
end
