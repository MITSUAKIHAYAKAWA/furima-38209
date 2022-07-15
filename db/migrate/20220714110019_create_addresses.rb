class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer   :prefecture_id
      t.string    :city
      t.string    :block
      t.string    :building
      t.string    :postcode
      t.string    :phone_number
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
