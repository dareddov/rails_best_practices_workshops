class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.belongs_to :owner, index: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
