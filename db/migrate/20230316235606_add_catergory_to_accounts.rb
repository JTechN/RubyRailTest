class AddCatergoryToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :category, :string
    add_column :accounts, :subcategory, :string
    add_column :accounts, :statement, :string
  end
end
