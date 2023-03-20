class AccountController < ApplicationController
  Trestle.resource(:accounts) do
    # Define a custom action for deactivating users
    action :deactivate, method: :put do
      # Find the user by its ID
      account = Account.find(params[:id])
      # Update the active attribute to false
      account.update(active: false)
      # Redirect back to the index page
      redirect_to admin_path(:account), notice: "Account deactivated successfully!"
    end
  end
end
