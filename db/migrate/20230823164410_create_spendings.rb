class CreateSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :spendings do |t|
      t.string :name 
      t.integer :amount
      t.references :author, references: :users, foregin_key: { to_table: :users}
      t.timestamps
    end
  end
end
