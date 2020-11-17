class AddColumnToOrderTable < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :paid_status, :boolean, null: false
    add_column :orders, :completed, :boolean, null: false, default: false
  end
end
