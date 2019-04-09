class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :user_id
      t.integer :client_id
      t.integer :bid_amount
      t.integer :deadline

      t.timestamps
    end
  end
end
