class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.belongs_to :owner, index: true
      t.text :message

      t.timestamps
    end
  end
end
