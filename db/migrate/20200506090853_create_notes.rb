class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
  	  t.integer :user_id
  	  t.integer :genre_id
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
