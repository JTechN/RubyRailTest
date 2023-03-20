class AddDeactivatedToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :deactivated, :boolean
  end
end
