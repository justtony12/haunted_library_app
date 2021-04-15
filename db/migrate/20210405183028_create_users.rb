class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest

      t.string :uid
      t.string :provider

      t.string :facebook_picture_url

      t.timestamps null: false
    end
  end
end
