class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.belongs_to :owner_id, index: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
