class AccountController < ApplicationController
  # Trestle.resource(:accounts) do
  #   # Define a custom action for deactivating users
  #   action :deactivate, method: :put do
  #     # Find the user by its ID
  #     account = Account.find(params[:id])
  #     # Update the active attribute to false
  #     account.update(active: false)
  #     # Redirect back to the index page
  #     redirect_to accounts_admin_path(:account), notice: "Account deactivated successfully!"
  #   end
  # end

  def activate
    @account = Account.find(params[:id])
    @account.update(active: true)
    redirect_to accounts_admin_path, notice: "User activated successfully."
  end

  def deactivate
    @account = Account.find(params[:id])
    @account.update(active: false)
    redirect_to accounts_admin_path, notice: "User deactivated successfully."
  end
end
