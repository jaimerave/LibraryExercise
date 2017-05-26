class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :length
      t.integer :copies
      t.string :item_type

      t.timestamps
    end
  end
end
