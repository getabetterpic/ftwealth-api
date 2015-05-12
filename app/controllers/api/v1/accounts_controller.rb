class Api::V1::AccountsController < Api::V1::ApplicationController
  before_action :set_account, only: [:show, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = current_user.accounts.all

    render json: @accounts
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    render json: @account
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = current_user.accounts.new(account_params)

    if @account.save
      render json: @account, status: :created, location: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    @account = current_user.accounts.find(params[:id])

    if @account.update(account_params)
      head :no_content
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy

    head :no_content
  end

  private

    def set_account
      @account = current_user.accounts.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:user_id, :financial_institution_id, :reference, :account_type, :status, :credential_id, :available_balance, :posted_balance, :last_synced_at, :balance_as_of_date, :description, :bankid)
    end
end
