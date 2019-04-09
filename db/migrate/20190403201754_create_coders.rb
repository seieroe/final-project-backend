class CreateCoders < ActiveRecord::Migration[5.2]
  def change
    create_table :coders do |t|
      t.string :name
      t.string :language
      t.integer :photo_id

      t.timestamps
    end
  end
end
