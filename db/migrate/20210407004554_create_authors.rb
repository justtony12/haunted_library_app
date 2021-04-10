class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :bio
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
