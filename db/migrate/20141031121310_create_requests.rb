class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :report
      t.belongs_to :ticket

      t.timestamps
    end
  end
  
  def down
    drop_table :requests
  end
end
