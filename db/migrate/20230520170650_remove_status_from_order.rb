class RemoveStatusFromOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :status, :string
  end
end
