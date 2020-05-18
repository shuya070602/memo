class CreateGroupNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :group_notes do |t|
      t.references :group, foreign_key: true
      t.string :title
      t.string :body


      t.timestamps
    end
  end
end
