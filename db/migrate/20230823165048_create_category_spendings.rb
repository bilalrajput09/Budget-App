class CreateCategorySpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :category_spendings do |t|
      t.references :category, null: false, foregin_key: true
      t.references :spending, null: false, foregin_key: true
      t.timestamps
    end
  end
end
