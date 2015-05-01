class Api::V1::CredentialsController < Api::V1::ApplicationController
  before_action :set_credential, only: [:show, :update, :destroy]

  # GET /credentials
  # GET /credentials.json
  def index
    @credentials = Credential.all

    render json: @credentials
  end

  # GET /credentials/1
  # GET /credentials/1.json
  def show
    render json: @credential
  end

  # POST /credentials
  # POST /credentials.json
  def create
    @credential = Credential.new(credential_params)

    if @credential.save
      render json: @credential, status: :created, location: @credential
    else
      render json: @credential.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /credentials/1
  # PATCH/PUT /credentials/1.json
  def update
    @credential = Credential.find(params[:id])

    if @credential.update(credential_params)
      head :no_content
    else
      render json: @credential.errors, status: :unprocessable_entity
    end
  end

  # DELETE /credentials/1
  # DELETE /credentials/1.json
  def destroy
    @credential.destroy

    head :no_content
  end

  private

    def set_credential
      @credential = Credential.find(params[:id])
    end

    def credential_params
      params.require(:credential).permit(:encrypted_password, :encrypted_username, :financial_institution_id, :user_id)
    end
end
