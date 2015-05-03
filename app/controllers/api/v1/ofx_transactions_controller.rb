class Api::V1::OfxTransactionsController < Api::V1::ApplicationController
  before_action :set_ofx_transaction, only: [:show, :update, :destroy]

  # GET /ofx_transactions
  # GET /ofx_transactions.json
  def index
    @ofx_transactions = OfxTransaction.all

    render json: @ofx_transactions
  end

  # GET /ofx_transactions/1
  # GET /ofx_transactions/1.json
  def show
    render json: @ofx_transaction
  end

  # POST /ofx_transactions
  # POST /ofx_transactions.json
  def create
    @ofx_transaction = OfxTransaction.new(ofx_transaction_params)

    if @ofx_transaction.save
      render json: @ofx_transaction, status: :created, location: @ofx_transaction
    else
      render json: @ofx_transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ofx_transactions/1
  # PATCH/PUT /ofx_transactions/1.json
  def update
    @ofx_transaction = OfxTransaction.find(params[:id])

    if @ofx_transaction.update(ofx_transaction_params)
      head :no_content
    else
      render json: @ofx_transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ofx_transactions/1
  # DELETE /ofx_transactions/1.json
  def destroy
    @ofx_transaction.destroy

    head :no_content
  end

  private

    def set_ofx_transaction
      @ofx_transaction = OfxTransaction.find(params[:id])
    end

    def ofx_transaction_params
      params.require(:ofx_transaction).permit(:amount, :description, :ofx_date, :ofx_id, :scheduled_transaction_id, :account_id)
    end
end
