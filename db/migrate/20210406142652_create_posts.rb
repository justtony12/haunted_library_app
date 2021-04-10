class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :content
      t.integer :genre_id
      t.integer :author_id
      # t.integer :user_id

      t.timestamps null: false
    end
  end
end
