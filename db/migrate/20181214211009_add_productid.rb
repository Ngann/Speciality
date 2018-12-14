class AddProductid < ActiveRecord::Migration[5.2]
  def change
    change_table :reviews do |t|
      t.column :product_id, :integer
    end
  end
end
