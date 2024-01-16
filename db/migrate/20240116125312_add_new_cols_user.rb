class AddNewColsUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :status, :string, default: "pending"
  end
end
