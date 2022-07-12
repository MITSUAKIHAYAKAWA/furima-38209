class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :product_name
      t.integer    :category_id
      t.integer    :condition_id
      t.text       :description
      t.integer    :price
      t.integer    :delivery_time_id
      t.integer    :delivery_charge_id
      t.integer    :ship_form_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end