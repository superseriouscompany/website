class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :fcm_id

      t.timestamps null: false
    end
  end
end
