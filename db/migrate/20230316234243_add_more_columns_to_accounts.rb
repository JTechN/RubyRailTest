class AddMoreColumnsToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :number, :number
    add_column :accounts, :description, :string
    add_column :accounts, :normal_side, :string
    add_column :accounts, :initial_balance, :number
    add_column :accounts, :debit, :number
    add_column :accounts, :credit, :number
    add_column :accounts, :balance, :number
    add_column :accounts, :order, :number
    add_column :accounts, :comment, :string
  end
end
