class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :rolename
      t.boolean :admin
      t.timestamps
    end
  end
end
