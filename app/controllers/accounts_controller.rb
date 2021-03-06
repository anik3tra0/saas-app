class AccountsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  def new
    @account = Account.new
    @account.build_owner
  end

  def create
    @account = Account.new(account_params)
    if @account.valid?
      Apartment::Tenant.create(@account.subdomain)
      Apartment::Tenant.switch!(@account.subdomain)
      @account.save
      sleep 5 # Time for Cloudflare to setup subdomain
      redirect_to new_user_session_url(subdomain: @account.subdomain)
    else
      redirect_to root_path, alert: 'Something Went Wrong, Please Try Again'
    end
  end

  private

  def account_params
    params.require(:account).permit(:subdomain, owner_attributes: [:name, :email, :password, :password_confirmation])
  end
end
