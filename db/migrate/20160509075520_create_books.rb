class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :des
      t.integer :isbn

      t.timestamps null: false
    end
  end
end
