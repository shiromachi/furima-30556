class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postal_code,    null: false
      t.integer :region_id,     null: false
      t.string :city,           null: false
      t.string :street,         null: false
      t.string :building
      t.integer :phone,         null: false
      t.references :management, null: false, foreign_key: true

      t.timestamps
    end
  end
end
