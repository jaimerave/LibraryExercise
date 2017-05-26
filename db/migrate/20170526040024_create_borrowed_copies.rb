class CreateBorrowedCopies < ActiveRecord::Migration[5.1]
  def change
    create_table :borrowed_copies do |t|
      t.references :item_copy, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
