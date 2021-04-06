class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :content
      t.string :genre
      t.integer :rating
      t.string :author

      t.datetime :date_published

      t.timestamps
    end
  end
end
