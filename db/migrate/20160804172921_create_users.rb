class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.string :session_token
      t.timestamps
    end
    add_index :users, :email
    add_index :users, :session_token
  end
end
