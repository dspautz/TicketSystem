class CreateRequests < ActiveRecord::Migration
  def change
    create_table :ticket_requests do |t|
      t.text :report
      t.belongs_to :ticket

      t.timestamps
    end
  end
  
  def down
    drop_table :ticket_requests
  end
end
