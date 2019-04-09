class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :name
      t.integer :project_id
      t.integer :coder_id

      t.timestamps
    end
  end
end
