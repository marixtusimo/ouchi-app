class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :station, null: false
      t.integer :price, null: false
      t.string :access, null: false
      t.text :describe, null: false
      t.references :owner, null: false, foreign_key: true
      t.timestamps
    end
  end
end
