class Api::V1::FinancialInstitutionsController < Api::V1::ApplicationController
  skip_before_filter :restrict_access, only: :index
  before_action :set_financial_institution, only: [:show, :update, :destroy]

  # GET /financial_institutions
  # GET /financial_institutions.json
  def index
    @financial_institutions = FinancialInstitution.all

    render json: @financial_institutions
  end

  # GET /financial_institutions/1
  # GET /financial_institutions/1.json
  def show
    render json: @financial_institution
  end

  # POST /financial_institutions
  # POST /financial_institutions.json
  def create
    @financial_institution = FinancialInstitution.new(financial_institution_params)

    if @financial_institution.save
      render json: @financial_institution, status: :created, location: @financial_institution
    else
      render json: @financial_institution.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /financial_institutions/1
  # PATCH/PUT /financial_institutions/1.json
  def update
    @financial_institution = FinancialInstitution.find(params[:id])

    if @financial_institution.update(financial_institution_params)
      head :no_content
    else
      render json: @financial_institution.errors, status: :unprocessable_entity
    end
  end

  # DELETE /financial_institutions/1
  # DELETE /financial_institutions/1.json
  def destroy
    @financial_institution.destroy

    head :no_content
  end

  private

    def set_financial_institution
      @financial_institution = FinancialInstitution.find(params[:id])
    end

    def financial_institution_params
      params.require(:financial_institution).permit(:name, :fid, :org, :url, :last_ofx_validation, :last_ssl_validation, :ofx_template, :sync_type, :sync_class)
    end
end
