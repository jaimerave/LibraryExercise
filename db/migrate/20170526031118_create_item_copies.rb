class CreateItemCopies < ActiveRecord::Migration[5.1]
  def change
    create_table :item_copies do |t|
      t.references :item, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
