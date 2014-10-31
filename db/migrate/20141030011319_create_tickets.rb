class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :status
      t.string :subject
      t.belongs_to :user
      t.string :customer_name
      t.string :customer_email 
      t.string :customer_department
      t.string :reference_no

      t.timestamps
    end
  end
  
  def down
    drop_table :tickets
  end
end
