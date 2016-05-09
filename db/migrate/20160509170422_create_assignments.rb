class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :book_id
      t.integer :author_id

      t.timestamps null: false
    end
    add_index :assignments, :book_id
    add_index :assignments, :author_id
  end
end
