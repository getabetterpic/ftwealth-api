class ScheduledTransactionsController < ApplicationController
  before_action :set_scheduled_transaction, only: [:show, :update, :destroy]

  # GET /scheduled_transactions
  # GET /scheduled_transactions.json
  def index
    @scheduled_transactions = ScheduledTransaction.all

    render json: @scheduled_transactions
  end

  # GET /scheduled_transactions/1
  # GET /scheduled_transactions/1.json
  def show
    render json: @scheduled_transaction
  end

  # POST /scheduled_transactions
  # POST /scheduled_transactions.json
  def create
    @scheduled_transaction = ScheduledTransaction.new(scheduled_transaction_params)

    if @scheduled_transaction.save
      render json: @scheduled_transaction, status: :created, location: @scheduled_transaction
    else
      render json: @scheduled_transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scheduled_transactions/1
  # PATCH/PUT /scheduled_transactions/1.json
  def update
    @scheduled_transaction = ScheduledTransaction.find(params[:id])

    if @scheduled_transaction.update(scheduled_transaction_params)
      head :no_content
    else
      render json: @scheduled_transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scheduled_transactions/1
  # DELETE /scheduled_transactions/1.json
  def destroy
    @scheduled_transaction.destroy

    head :no_content
  end

  private

    def set_scheduled_transaction
      @scheduled_transaction = ScheduledTransaction.find(params[:id])
    end

    def scheduled_transaction_params
      params.require(:scheduled_transaction).permit(:amount, :description, :day_of_month, :properties)
    end
end
