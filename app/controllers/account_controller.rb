class AccountController < ApplicationController
  Trestle.resource(:accounts) do
    action :activate, method: :put do
      account = Account.find(params[:id])
      account.update_attribute(:deactivated, false)
      flash[:success] = "User account activated."
      redirect_to accounts_path
    end

    action :deactivate, method: :put do
      account = Account.find(params[:id])
      account.update_attribute(:deactivated, true)
      flash[:success] = "User account deactivated."
      redirect_to accounts_path
    end
  end

  # def activate
  #   @account = Account.find(params[:id])
  #   @account.update(deactivated: false)
  #   redirect_to accounts_admin_path, notice: "User activated successfully."
  # end

  # def deactivate
  #   @account = Account.find(params[:id])
  #   @account.update(deactivated: true)
  #   redirect_to accounts_admin_path, notice: "User deactivated successfully."
  # end
end
