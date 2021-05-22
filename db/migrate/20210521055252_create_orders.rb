class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :postage
      t.integer :total_payment
      t.integer :customer_id
      t.integer :order_status
      t.boolean :payment_option

      t.timestamps
    end
  end
end
