class CreateBorrowedItems < ActiveRecord::Migration[5.1]
  def change
    create_table :borrowed_items do |t|
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
