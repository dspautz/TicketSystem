class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.belongs_to :role
      t.text :password_salt
      t.text :password_hash

      t.timestamps
    end
  end
  
   def down
    drop_table :users
  end
end
