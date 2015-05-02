class TransController < ApplicationController
  before_action :set_tran, only: [:show, :update, :destroy]

  # GET /trans
  # GET /trans.json
  def index
    @trans = Tran.all

    render json: @trans
  end

  # GET /trans/1
  # GET /trans/1.json
  def show
    render json: @tran
  end

  # POST /trans
  # POST /trans.json
  def create
    @tran = Tran.new(tran_params)

    if @tran.save
      render json: @tran, status: :created, location: @tran
    else
      render json: @tran.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trans/1
  # PATCH/PUT /trans/1.json
  def update
    @tran = Tran.find(params[:id])

    if @tran.update(tran_params)
      head :no_content
    else
      render json: @tran.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trans/1
  # DELETE /trans/1.json
  def destroy
    @tran.destroy

    head :no_content
  end

  private

    def set_tran
      @tran = Tran.find(params[:id])
    end

    def tran_params
      params.require(:tran).permit(:amount, :description, :tran_date, :account_id)
    end
end
